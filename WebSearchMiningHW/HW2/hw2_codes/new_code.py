import logging
import os
from pathlib import Path
import time
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity, euclidean_distances 
from nltk.stem.porter import PorterStemmer

logging_format = '%(levelname)s: \n %(message)s'
logging.basicConfig(level=logging.WARNING, format=logging_format)

class VectorSpace:
    """ A algebraic model for representing text corpus as vectors of identifiers. 
    A document is represented as a vector. Each dimension of the vector corresponds to a 
    separate term. If a term occurs in the document, then the value in the vector is non-zero.
    """

    # stop word list
    stop_words_list = Path('./data/EnglishStopwords.txt').read_text().split("\n")

    def __init__(self, weight, similarity, corpus=[]):
        self.w_method = weight
        self.s_method = similarity
        self.stemmer = PorterStemmer()
        self.analyzer = CountVectorizer().build_analyzer()

        if (self.w_method == "TF Weighting"):
            self.doc_vectorizer = CountVectorizer(analyzer = lambda doc: (self.stemmer.stem(w) for w in self.analyzer(doc) if w not in self.stop_words_list)) 
        elif (self.w_method == "TF-IDF Weighting"):
            self.doc_vectorizer = TfidfVectorizer(analyzer = lambda doc: (self.stemmer.stem(w) for w in self.analyzer(doc) if w not in self.stop_words_list)) 

        if (self.s_method == "Cosine Similarity"):
            self.distance = cosine_similarity 
        elif (self.s_method == "Euclidean Distance"):
            self.distance = euclidean_distances

        if corpus :
            self.build(corpus)

    def build(self,corpus):
        """ Create the vector space for the passed document strings """
        self.documentVectors = self.makeVector(corpus)
        self.vectorKeywordIndex = {word:n for n,word in enumerate(self.doc_vectorizer.get_feature_names_out())}
        logging.debug(f'vector keyword index:  {self.vectorKeywordIndex}')
        logging.debug(f'document vector:  {self.documentVectors}')

    def makeVector(self, corpus):
        """ make corpus vector """

        vector = self.doc_vectorizer.fit_transform(corpus)
        return vector.toarray()

    def related(self,documentId):
        """ find corpus that are related to the document indexed by passed Id within the document Vectors"""
        ratings = [util.cosine(self.documentVectors[documentId], documentVector) for documentVector in self.documentVectors]
        #ratings.sort(reverse=True)
        return ratings

    def search(self,searchList):
        """ search for documents that match based on a list of terms """
        query_vector = self.doc_vectorizer.transform(searchList)
        logging.debug(f"query vector={query_vector.toarray()}")
        ratings = self.distance(query_vector.toarray(), self.documentVectors)
        return ratings[0]


if __name__ == '__main__':

    read_start = time.time()
    doc_dir = Path('./data/EnglishNews')
    doc_name_list = []
    corpus = []
    for doc_name in os.listdir(doc_dir): 
        with open(doc_dir/doc_name, 'r') as f:
            doc_name_list.append(doc_name[:-4])
            corpus.append(f.read())
    read_end = time.time()
    logging.info(f"read time:{read_end-read_start}")

    # # test data
    # doc_name_list = ["A", "B", "C", "D"]
    # corpus = ["The cat in the hat disabled",
    #           "A cat is a fine pet ponies.",
    #           "Dogs and cats make good pets.",
    #           "I get haven't got a hat."]


    test_settings = [["TF Weighting", "Cosine Similarity"],
                     ["TF Weighting", "Euclidean Distance"],
                     ["TF-IDF Weighting" , "Cosine Similarity"],
                     ["TF-IDF Weighting" , "Euclidean Distance"]]

    for weight, relavance_cal in test_settings:

        vector_build_start = time.time()
        vector_space = VectorSpace(weight, relavance_cal, corpus)
        vector_build_end = time.time()

        unsorted_result = vector_space.search(["Trump Biden Taiwan China"])
        sorted_doc_name_list = [doc_name_list[r] for r in unsorted_result.argsort()] 
        result = np.sort(unsorted_result)
        print_order = range(0,10) if (relavance_cal == "Euclidean Distance") else range(-1, -11, -1)

        print((f"{weight} + {relavance_cal}\n"
               f"NewsID          Score\n"
               f"----------      ----------"))
        for i in print_order:
            print(f"{sorted_doc_name_list[i]}      {result[i]}")

        print(f"data size: {len(doc_name_list)}", end="\n\n")
        print(f"Execution Time:{time.strftime('%H:%M:%S', time.gmtime(vector_build_end - vector_build_start))}")
        print("-"*50)

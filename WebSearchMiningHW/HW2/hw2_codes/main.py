import logging
import os
from pathlib import Path
import time
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity, euclidean_distances
from nltk.stem.porter import PorterStemmer
import nltk
import jieba
import argparse

logging_format = '%(levelname)s: \n %(message)s'
logging.basicConfig(level=logging.WARNING, format=logging_format)
logger_jieba_1 = logging.getLogger('jieba')
logger_jieba_2 = logging.getLogger('jieba._compat')
logger_jieba_1.setLevel(logging.WARNING)
logger_jieba_2.setLevel(logging.WARNING)
ap = argparse.ArgumentParser()
ap.add_argument("--query", required = True, help = "Input a query string")
ap.add_argument("-d", "--display", required = True, type=int, default=10, help = "Input the amount of display results")
ap.add_argument("--chinese", action='store_true', help = "Input whether to detect Chinese news or not")
ap.add_argument("--no-chinese", dest='chinese', action='store_false', help = "Input whether to detect Chinese news or not")
args = vars(ap.parse_args())


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
            self.doc_vectorizer = TfidfVectorizer(analyzer = lambda doc: (self.stemmer.stem(w) for w in self.analyzer(doc) if w not in self.stop_words_list),
                                                  norm = None, ngram_range=(1,1)) 

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

    def search(self,search_list, feedback_list):
        """ search for documents that match based on a list of terms """
        if feedback_list:
            ori_query_vector = self.doc_vectorizer.transform(search_list)
            fb_query_vector = self.doc_vectorizer.transform(feedback_list)
            query_vector = 1*ori_query_vector + 0.5*fb_query_vector 
        else:
            query_vector = self.doc_vectorizer.transform(search_list)
            logging.debug(f"query vector={query_vector.toarray()}")
        ratings = self.distance(query_vector.toarray(), self.documentVectors)
        logging.debug(f"query ratings shape: {ratings.shape}")
        return ratings[0]


def rank_doc(weight, relavance_cal, feedback):

    rank_start = time.time()
    vector_space = VectorSpace(weight, relavance_cal, corpus)

    unsorted_result = vector_space.search([args["query"]], [])

    if feedback:
        fb_ind = unsorted_result.argmax()
        logging.debug(f"feedback doc:{doc_name_list[fb_ind]}, its content:\n {corpus[fb_ind]}")
        tokens = nltk.word_tokenize(corpus[fb_ind])
        tagged_sent = nltk.pos_tag(tokens)
        need_tag = {"NN", "NNP", "NNS", "NNPS", "VB", "VBG", "VBZ", "VBN", "VBD", "VBP"}
        feedback_list = " ".join([word for word, tag in tagged_sent if tag in need_tag])
        logging.debug(f"after post tag, feedback doc:\n{feedback_list}")
        unsorted_result = vector_space.search([args["query"]], [feedback_list])


    sorted_doc_name_list = [doc_name_list[r] for r in unsorted_result.argsort()] 
    result = np.sort(unsorted_result)
    print_order = range(0,args["display"]) if (relavance_cal == "Euclidean Distance") else range(-1, -1*args["display"]-1, -1)
    rank_end = time.time()

    print((f"{feedback}{weight} + {relavance_cal}\n"
            f"NewsID          Score\n"
            f"----------      ----------"))
    for i in print_order:
        print(f"{sorted_doc_name_list[i]}      {result[i]}")

    print(f"data size: {len(doc_name_list)}", end="\n\n")
    print(f"Execution Time:{time.strftime('%H:%M:%S', time.gmtime(rank_end - rank_start))}")
    print("-"*50)

if __name__ == '__main__':

    # load articles
    read_start = time.time()
    doc_name_list = []
    corpus = []
    if args["chinese"] :
        doc_dir = Path('./data/News')
        for doc_name in os.listdir(doc_dir): 
            with open(doc_dir/doc_name, 'r') as f:
                doc_name_list.append(doc_name[:-4])
                sents = f.read()
                if any(map(lambda c:'\u4e00' <= c <= '\u9fa5',sents)):
                    cut_words = jieba.cut_for_search(sents) 
                    corpus.append(" ".join(cut_words))
                else:
                    corpus.append(sents)
    else:
        doc_dir = Path('./data/EnglishNews')
        for doc_name in os.listdir(doc_dir): 
            with open(doc_dir/doc_name, 'r') as f:
                doc_name_list.append(doc_name[:-4])
                corpus.append(f.read())
    read_end = time.time()
    logging.info(f"read time:{read_end-read_start}")
    logging.info(f"doc_name_list len:{len(doc_name_list)}, corpus len:{len(corpus)}")
    logging.debug(f"corpus : {corpus}")


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

    # start rank Documents
    if not args['chinese']:
        for weight, relavance_cal in test_settings:
            rank_doc(weight, relavance_cal, "")

        # original query + pseudo feedback
        rank_doc("TF-IDF Weighting" , "Cosine Similarity", "Feedback Query + ")
    else:
        rank_doc("TF-IDF Weighting" , "Cosine Similarity", "")

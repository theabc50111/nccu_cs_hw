from pprint import pprint
from Parser import Parser
import util
from tfidf import tfidf
from textblob import TextBlob as tb
import logging
import os
from pathlib import Path
import time

logging_format = '%(levelname)s: \n %(message)s'
logging.basicConfig(level=logging.INFO, format=logging_format)

class VectorSpace:
    """ A algebraic model for representing text documents as vectors of identifiers. 
    A document is represented as a vector. Each dimension of the vector corresponds to a 
    separate term. If a term occurs in the document, then the value in the vector is non-zero.
    """

    #Collection of document term vectors
    documentVectors = []

    #Mapping of vector index to keyword
    vectorKeywordIndex=[]

    #Tidies terms
    parser=None


    def __init__(self, weight, similarity, documents=[]):
        self.documentVectors=[]
        self.parser = Parser()
        self.w_method = weight
        self.s_method = similarity
        self.tb_documents = [tb(doc) for doc in documents]
        if(len(documents)>0):
            self.build(documents)

    def build(self,documents):
        """ Create the vector space for the passed document strings """
        self.vectorKeywordIndex = self.getVectorKeywordIndex(documents)
        self.documentVectors = [self.makeVector(document) for document in documents]
        logging.debug(f'vector keyword index:  {self.vectorKeywordIndex}')
        logging.debug(f'document vector:  {self.documentVectors}')



    def getVectorKeywordIndex(self, documentList):
        """ create the keyword associated to the position of the elements within the document vectors """

        #Mapped documents into a single word string	
        vocabularyString = " ".join(documentList)

        vocabularyList = self.parser.tokenise(vocabularyString)
        #Remove common words which have no search value
        vocabularyList = self.parser.removeStopWords(vocabularyList)
        uniqueVocabularyList = util.removeDuplicates(vocabularyList)

        vectorIndex={}
        offset=0
        #Associate a position with the keywords which maps to the dimension on the vector used to represent this word
        for word in uniqueVocabularyList:
            vectorIndex[word]=offset
            offset+=1
        return vectorIndex  #(keyword:position)


    def makeVector(self, doc):
        """ @pre: unique(vectorIndex) """

        #Initialise vector with 0's
        vector = [0] * len(self.vectorKeywordIndex)
        wordList = self.parser.tokenise(doc)
        wordList = self.parser.removeStopWords(wordList)
        if self.w_method=="tf":
            for word in wordList:
                vector[self.vectorKeywordIndex[word]] += 1; #Use simple Term Count Model
            return vector

        elif self.w_method=="tf-idf":
            tb_doc = tb(doc)
            for word in wordList:
                vector[self.vectorKeywordIndex[word]] = tfidf(word, tb_doc, self.tb_documents) #Use simple Term Count Model
            return vector

        else:
            raise Exception("Please specified weight methods")


    def buildQueryVector(self, termList):
        """ convert query string into a term vector """
        query = self.makeVector(" ".join(termList))
        return query


    def related(self,documentId):
        """ find documents that are related to the document indexed by passed Id within the document Vectors"""
        ratings = [util.cosine(self.documentVectors[documentId], documentVector) for documentVector in self.documentVectors]
        #ratings.sort(reverse=True)
        return ratings


    def search(self,searchList):
        """ search for documents that match based on a list of terms """
        queryVector = self.buildQueryVector(searchList)

        ratings = [util.cosine(queryVector, documentVector) for documentVector in self.documentVectors]
        #ratings.sort(reverse=True)
        return ratings


if __name__ == '__main__':

    read_start = time.time()
    doc_dir = Path('./data/EnglishNews')
    doc_name_list = []
    documents = []
    count=0
    for doc_name in os.listdir(doc_dir): 
        with open(doc_dir/doc_name, 'r') as f:
            doc_name_list.append(doc_name)
            documents.append(f.read())
    read_end = time.time()
    logging.info(f"read time:{read_end-read_start}")
    logging.info(f"doc_name_list len:{len(doc_name_list)}, documents len:{len(documents)}")

    # #test data
    # documents = ["The cat in the hat disabled",
    #              "A cat is a fine pet ponies.",
    #              "Dogs and cats make good pets.",
    #              "I get haven't got a hat."]

    vector_build_start = time.time()
    vectorSpace = VectorSpace("tf", "cosine", documents)
    vector_build_end = time.time()
    logging.info(f"vector_build time:{vector_build_end - vector_build_start}")

    print("-"*50)
    print(vectorSpace.related(1))

###################################################

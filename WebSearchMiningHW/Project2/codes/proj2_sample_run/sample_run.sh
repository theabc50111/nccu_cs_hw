#!/bin/sh
#######################################################################
# THIS IS THE TEST SCRIPT FOR THE INDRI QUERY LANGUAGE                #
#######################################################################
# First erase any existing files 
./clean.sh
mkdir index
# Then prepare parameters
cp params/*.param .
#######################################################################
# The following command builds a position index of the CACM database  #
#  directly from a simple SGML format source                          #
# Note that the version of database.sgml used has been modified to    #
# include <TEXT> tags around the body of each document.               #
# Uses the stopword list provided in smallstop_param.                 #
#######################################################################

IndriBuildIndex index_indri.param
# Build index with some stopwords
#IndriBuildIndex index_indri_with_stop.param

#######################################################################
# The following shows how to run simple retrieval                     #
# experiments with indri query language queries.                      #
#######################################################################

# simple query retrieval example
IndriRunQuery ret.param query.txt > res.txt
perl trec_eval qrels.401-450.txt res.txt

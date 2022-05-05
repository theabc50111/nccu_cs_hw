import networkx as nx
import matplotlib.pyplot as plt
import numpy as np


def print_matrix(matrix):
    for i in xrange(len(matrix)):
        for j in xrange(len(matrix[i])):
            if(j==(len(matrix[i])-1)):
                print matrix[i][j]
            else:
                print matrix[i][j],
        
        


#parameter graph_matrix
#graph_matrix = [[1,0,1,0],[0,0,0,0],[1,1,1,1],[1,1,0,0]]
#graph_matrix = [[1,0,1,0,0],[0,0,0,0,0],[1,1,1,1,0],[1,1,0,0,0]]
graph_matrix = np.random.randint(2,size=(20,10)).tolist()
row = len(graph_matrix)
column = len(graph_matrix[0])

#parameter position
position_x = np.random.randint(0,row-1)
position_y = np.random.randint(0,column-1)
position = (position_x,position_y)

graph = nx.Graph()
graph_edge = list()
flip_value = int(not(graph_matrix[position[0]][position[1]]))
index_dictionary = dict()
flip_list = list()
print row,column
print_matrix(graph_matrix)
print position[0],position[1]


#content
for i in xrange(0,row-1):
    for j in xrange(0,column-1):
        current_index = j+i*column
        right_index = (j+1)+i*column
        down_index = j+(i+1)*column
        index_dictionary.update({(i,j):current_index})
        #right connect
        if(graph_matrix[i][j]==graph_matrix[i][j+1]):
            graph_edge.append( (current_index,right_index) )
        #down connect
        if(graph_matrix[i][j]==graph_matrix[i+1][j]):
            graph_edge.append( (current_index,down_index) )

#right border
for i in xrange(0,row-1):
    current_index = column-1+i*column
    down_index = column-1+(i+1)*column
    index_dictionary.update({(i,column-1):current_index})
    if(graph_matrix[i][column-1]==graph_matrix[i+1][column-1]):
        graph_edge.append( (current_index,down_index) )
#down_border
for j in xrange(0,column-1):
    current_index = j+(row-1)*column
    right_index = (j+1)+(row-1)*column
    index_dictionary.update({(row-1,j):current_index})
    if(graph_matrix[row-1][j]==graph_matrix[row-1][j+1]):
        graph_edge.append( (current_index,right_index) )
index_dictionary.update( {(row-1,column-1):((column-1)+(row-1)*column) } )


graph.add_edges_from(graph_edge)       

#nx.draw(graph,with_labels=True)
#plt.show()


#get position index
get_index = index_dictionary[position]
#print get_index

dfs = list(nx.dfs_preorder_nodes(graph,get_index))
#print dfs

for pos, node_index in index_dictionary.iteritems():
    if node_index in dfs:
        flip_list.append(pos)

for flip in flip_list:
    graph_matrix[flip[0]][flip[1]]=flip_value

print_matrix(graph_matrix)
components = list(nx.connected_component_subgraphs(graph))
max = 0
for component in components:
    if nx.number_of_nodes(component)>max:
        max = nx.number_of_nodes(component)
print max

��
��
B
AssignVariableOp
resource
value"dtype"
dtypetype�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.7.02v2.7.0-rc1-69-gc256c071bb28��
�
dnn_base_2-units/dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*0
shared_name!dnn_base_2-units/dense_3/kernel
�
3dnn_base_2-units/dense_3/kernel/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_3/kernel*
_output_shapes
:	�*
dtype0
�
dnn_base_2-units/dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namednn_base_2-units/dense_3/bias
�
1dnn_base_2-units/dense_3/bias/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_3/bias*
_output_shapes
:*
dtype0
�
dnn_base_2-units/dense_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*0
shared_name!dnn_base_2-units/dense_4/kernel
�
3dnn_base_2-units/dense_4/kernel/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_4/kernel*
_output_shapes

:*
dtype0
�
dnn_base_2-units/dense_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namednn_base_2-units/dense_4/bias
�
1dnn_base_2-units/dense_4/bias/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_4/bias*
_output_shapes
:*
dtype0
�
dnn_base_2-units/dense_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*0
shared_name!dnn_base_2-units/dense_5/kernel
�
3dnn_base_2-units/dense_5/kernel/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_5/kernel*
_output_shapes

:*
dtype0
�
dnn_base_2-units/dense_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namednn_base_2-units/dense_5/bias
�
1dnn_base_2-units/dense_5/bias/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_5/bias*
_output_shapes
:*
dtype0
�
dnn_base_2-units/dense_6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*0
shared_name!dnn_base_2-units/dense_6/kernel
�
3dnn_base_2-units/dense_6/kernel/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_6/kernel*
_output_shapes

:*
dtype0
�
dnn_base_2-units/dense_6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namednn_base_2-units/dense_6/bias
�
1dnn_base_2-units/dense_6/bias/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_6/bias*
_output_shapes
:*
dtype0
�
dnn_base_2-units/dense_7/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*0
shared_name!dnn_base_2-units/dense_7/kernel
�
3dnn_base_2-units/dense_7/kernel/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_7/kernel*
_output_shapes

:*
dtype0
�
dnn_base_2-units/dense_7/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namednn_base_2-units/dense_7/bias
�
1dnn_base_2-units/dense_7/bias/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_7/bias*
_output_shapes
:*
dtype0
�
dnn_base_2-units/dense_8/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*0
shared_name!dnn_base_2-units/dense_8/kernel
�
3dnn_base_2-units/dense_8/kernel/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_8/kernel*
_output_shapes

:*
dtype0
�
dnn_base_2-units/dense_8/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namednn_base_2-units/dense_8/bias
�
1dnn_base_2-units/dense_8/bias/Read/ReadVariableOpReadVariableOpdnn_base_2-units/dense_8/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
�
&Adam/dnn_base_2-units/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*7
shared_name(&Adam/dnn_base_2-units/dense_3/kernel/m
�
:Adam/dnn_base_2-units/dense_3/kernel/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_3/kernel/m*
_output_shapes
:	�*
dtype0
�
$Adam/dnn_base_2-units/dense_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_3/bias/m
�
8Adam/dnn_base_2-units/dense_3/bias/m/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_3/bias/m*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_4/kernel/m
�
:Adam/dnn_base_2-units/dense_4/kernel/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_4/kernel/m*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_4/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_4/bias/m
�
8Adam/dnn_base_2-units/dense_4/bias/m/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_4/bias/m*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_5/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_5/kernel/m
�
:Adam/dnn_base_2-units/dense_5/kernel/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_5/kernel/m*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_5/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_5/bias/m
�
8Adam/dnn_base_2-units/dense_5/bias/m/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_5/bias/m*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_6/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_6/kernel/m
�
:Adam/dnn_base_2-units/dense_6/kernel/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_6/kernel/m*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_6/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_6/bias/m
�
8Adam/dnn_base_2-units/dense_6/bias/m/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_6/bias/m*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_7/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_7/kernel/m
�
:Adam/dnn_base_2-units/dense_7/kernel/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_7/kernel/m*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_7/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_7/bias/m
�
8Adam/dnn_base_2-units/dense_7/bias/m/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_7/bias/m*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_8/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_8/kernel/m
�
:Adam/dnn_base_2-units/dense_8/kernel/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_8/kernel/m*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_8/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_8/bias/m
�
8Adam/dnn_base_2-units/dense_8/bias/m/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_8/bias/m*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*7
shared_name(&Adam/dnn_base_2-units/dense_3/kernel/v
�
:Adam/dnn_base_2-units/dense_3/kernel/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_3/kernel/v*
_output_shapes
:	�*
dtype0
�
$Adam/dnn_base_2-units/dense_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_3/bias/v
�
8Adam/dnn_base_2-units/dense_3/bias/v/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_3/bias/v*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_4/kernel/v
�
:Adam/dnn_base_2-units/dense_4/kernel/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_4/kernel/v*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_4/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_4/bias/v
�
8Adam/dnn_base_2-units/dense_4/bias/v/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_4/bias/v*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_5/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_5/kernel/v
�
:Adam/dnn_base_2-units/dense_5/kernel/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_5/kernel/v*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_5/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_5/bias/v
�
8Adam/dnn_base_2-units/dense_5/bias/v/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_5/bias/v*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_6/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_6/kernel/v
�
:Adam/dnn_base_2-units/dense_6/kernel/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_6/kernel/v*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_6/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_6/bias/v
�
8Adam/dnn_base_2-units/dense_6/bias/v/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_6/bias/v*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_7/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_7/kernel/v
�
:Adam/dnn_base_2-units/dense_7/kernel/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_7/kernel/v*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_7/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_7/bias/v
�
8Adam/dnn_base_2-units/dense_7/bias/v/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_7/bias/v*
_output_shapes
:*
dtype0
�
&Adam/dnn_base_2-units/dense_8/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*7
shared_name(&Adam/dnn_base_2-units/dense_8/kernel/v
�
:Adam/dnn_base_2-units/dense_8/kernel/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_2-units/dense_8/kernel/v*
_output_shapes

:*
dtype0
�
$Adam/dnn_base_2-units/dense_8/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/dnn_base_2-units/dense_8/bias/v
�
8Adam/dnn_base_2-units/dense_8/bias/v/Read/ReadVariableOpReadVariableOp$Adam/dnn_base_2-units/dense_8/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
�?
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�>
value�>B�> B�>
�

dense1

dense2

dense3

dense4

dense5
output_layer
	optimizer
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
h

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
h

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
h

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
h

kernel
 bias
!	variables
"trainable_variables
#regularization_losses
$	keras_api
h

%kernel
&bias
'	variables
(trainable_variables
)regularization_losses
*	keras_api
h

+kernel
,bias
-	variables
.trainable_variables
/regularization_losses
0	keras_api
�
1iter

2beta_1

3beta_2
	4decay
5learning_ratemdmemfmgmhmimj mk%ml&mm+mn,movpvqvrvsvtvuvv vw%vx&vy+vz,v{
V
0
1
2
3
4
5
6
 7
%8
&9
+10
,11
V
0
1
2
3
4
5
6
 7
%8
&9
+10
,11
 
�
6non_trainable_variables

7layers
8metrics
9layer_regularization_losses
:layer_metrics
	variables
	trainable_variables

regularization_losses
 
][
VARIABLE_VALUEdnn_base_2-units/dense_3/kernel(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEdnn_base_2-units/dense_3/bias&dense1/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
�
;non_trainable_variables

<layers
=metrics
>layer_regularization_losses
?layer_metrics
	variables
trainable_variables
regularization_losses
][
VARIABLE_VALUEdnn_base_2-units/dense_4/kernel(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEdnn_base_2-units/dense_4/bias&dense2/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
�
@non_trainable_variables

Alayers
Bmetrics
Clayer_regularization_losses
Dlayer_metrics
	variables
trainable_variables
regularization_losses
][
VARIABLE_VALUEdnn_base_2-units/dense_5/kernel(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEdnn_base_2-units/dense_5/bias&dense3/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
�
Enon_trainable_variables

Flayers
Gmetrics
Hlayer_regularization_losses
Ilayer_metrics
	variables
trainable_variables
regularization_losses
][
VARIABLE_VALUEdnn_base_2-units/dense_6/kernel(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEdnn_base_2-units/dense_6/bias&dense4/bias/.ATTRIBUTES/VARIABLE_VALUE

0
 1

0
 1
 
�
Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
!	variables
"trainable_variables
#regularization_losses
][
VARIABLE_VALUEdnn_base_2-units/dense_7/kernel(dense5/kernel/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEdnn_base_2-units/dense_7/bias&dense5/bias/.ATTRIBUTES/VARIABLE_VALUE

%0
&1

%0
&1
 
�
Onon_trainable_variables

Players
Qmetrics
Rlayer_regularization_losses
Slayer_metrics
'	variables
(trainable_variables
)regularization_losses
ca
VARIABLE_VALUEdnn_base_2-units/dense_8/kernel.output_layer/kernel/.ATTRIBUTES/VARIABLE_VALUE
_]
VARIABLE_VALUEdnn_base_2-units/dense_8/bias,output_layer/bias/.ATTRIBUTES/VARIABLE_VALUE

+0
,1

+0
,1
 
�
Tnon_trainable_variables

Ulayers
Vmetrics
Wlayer_regularization_losses
Xlayer_metrics
-	variables
.trainable_variables
/regularization_losses
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
 
*
0
1
2
3
4
5

Y0
Z1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
4
	[total
	\count
]	variables
^	keras_api
D
	_total
	`count
a
_fn_kwargs
b	variables
c	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

[0
\1

]	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

_0
`1

b	variables
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_3/kernel/mDdense1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_3/bias/mBdense1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_4/kernel/mDdense2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_4/bias/mBdense2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_5/kernel/mDdense3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_5/bias/mBdense3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_6/kernel/mDdense4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_6/bias/mBdense4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_7/kernel/mDdense5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_7/bias/mBdense5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_8/kernel/mJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_8/bias/mHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_3/kernel/vDdense1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_3/bias/vBdense1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_4/kernel/vDdense2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_4/bias/vBdense2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_5/kernel/vDdense3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_5/bias/vBdense3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_6/kernel/vDdense4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_6/bias/vBdense4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_7/kernel/vDdense5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_7/bias/vBdense5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE&Adam/dnn_base_2-units/dense_8/kernel/vJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE$Adam/dnn_base_2-units/dense_8/bias/vHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|
serving_default_input_1Placeholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1dnn_base_2-units/dense_3/kerneldnn_base_2-units/dense_3/biasdnn_base_2-units/dense_4/kerneldnn_base_2-units/dense_4/biasdnn_base_2-units/dense_5/kerneldnn_base_2-units/dense_5/biasdnn_base_2-units/dense_6/kerneldnn_base_2-units/dense_6/biasdnn_base_2-units/dense_7/kerneldnn_base_2-units/dense_7/biasdnn_base_2-units/dense_8/kerneldnn_base_2-units/dense_8/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8� *,
f'R%
#__inference_signature_wrapper_39275
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename3dnn_base_2-units/dense_3/kernel/Read/ReadVariableOp1dnn_base_2-units/dense_3/bias/Read/ReadVariableOp3dnn_base_2-units/dense_4/kernel/Read/ReadVariableOp1dnn_base_2-units/dense_4/bias/Read/ReadVariableOp3dnn_base_2-units/dense_5/kernel/Read/ReadVariableOp1dnn_base_2-units/dense_5/bias/Read/ReadVariableOp3dnn_base_2-units/dense_6/kernel/Read/ReadVariableOp1dnn_base_2-units/dense_6/bias/Read/ReadVariableOp3dnn_base_2-units/dense_7/kernel/Read/ReadVariableOp1dnn_base_2-units/dense_7/bias/Read/ReadVariableOp3dnn_base_2-units/dense_8/kernel/Read/ReadVariableOp1dnn_base_2-units/dense_8/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_3/kernel/m/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_3/bias/m/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_4/kernel/m/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_4/bias/m/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_5/kernel/m/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_5/bias/m/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_6/kernel/m/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_6/bias/m/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_7/kernel/m/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_7/bias/m/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_8/kernel/m/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_8/bias/m/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_3/kernel/v/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_3/bias/v/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_4/kernel/v/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_4/bias/v/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_5/kernel/v/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_5/bias/v/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_6/kernel/v/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_6/bias/v/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_7/kernel/v/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_7/bias/v/Read/ReadVariableOp:Adam/dnn_base_2-units/dense_8/kernel/v/Read/ReadVariableOp8Adam/dnn_base_2-units/dense_8/bias/v/Read/ReadVariableOpConst*:
Tin3
12/	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8� *'
f"R 
__inference__traced_save_39628
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamednn_base_2-units/dense_3/kerneldnn_base_2-units/dense_3/biasdnn_base_2-units/dense_4/kerneldnn_base_2-units/dense_4/biasdnn_base_2-units/dense_5/kerneldnn_base_2-units/dense_5/biasdnn_base_2-units/dense_6/kerneldnn_base_2-units/dense_6/biasdnn_base_2-units/dense_7/kerneldnn_base_2-units/dense_7/biasdnn_base_2-units/dense_8/kerneldnn_base_2-units/dense_8/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1&Adam/dnn_base_2-units/dense_3/kernel/m$Adam/dnn_base_2-units/dense_3/bias/m&Adam/dnn_base_2-units/dense_4/kernel/m$Adam/dnn_base_2-units/dense_4/bias/m&Adam/dnn_base_2-units/dense_5/kernel/m$Adam/dnn_base_2-units/dense_5/bias/m&Adam/dnn_base_2-units/dense_6/kernel/m$Adam/dnn_base_2-units/dense_6/bias/m&Adam/dnn_base_2-units/dense_7/kernel/m$Adam/dnn_base_2-units/dense_7/bias/m&Adam/dnn_base_2-units/dense_8/kernel/m$Adam/dnn_base_2-units/dense_8/bias/m&Adam/dnn_base_2-units/dense_3/kernel/v$Adam/dnn_base_2-units/dense_3/bias/v&Adam/dnn_base_2-units/dense_4/kernel/v$Adam/dnn_base_2-units/dense_4/bias/v&Adam/dnn_base_2-units/dense_5/kernel/v$Adam/dnn_base_2-units/dense_5/bias/v&Adam/dnn_base_2-units/dense_6/kernel/v$Adam/dnn_base_2-units/dense_6/bias/v&Adam/dnn_base_2-units/dense_7/kernel/v$Adam/dnn_base_2-units/dense_7/bias/v&Adam/dnn_base_2-units/dense_8/kernel/v$Adam/dnn_base_2-units/dense_8/bias/v*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8� **
f%R#
!__inference__traced_restore_39773��
�

�
B__inference_dense_7_layer_call_and_return_conditional_losses_39064

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
B__inference_dense_4_layer_call_and_return_conditional_losses_39013

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
B__inference_dense_5_layer_call_and_return_conditional_losses_39030

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
B__inference_dense_6_layer_call_and_return_conditional_losses_39047

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
'__inference_dense_3_layer_call_fn_39359

inputs
unknown:	�
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_38996o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
B__inference_dense_7_layer_call_and_return_conditional_losses_39450

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
'__inference_dense_8_layer_call_fn_39459

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_8_layer_call_and_return_conditional_losses_39081o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
'__inference_dense_4_layer_call_fn_39379

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_39013o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
'__inference_dense_6_layer_call_fn_39419

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_39047o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�E
�
 __inference__wrapped_model_38978
input_1J
7dnn_base_2_units_dense_3_matmul_readvariableop_resource:	�F
8dnn_base_2_units_dense_3_biasadd_readvariableop_resource:I
7dnn_base_2_units_dense_4_matmul_readvariableop_resource:F
8dnn_base_2_units_dense_4_biasadd_readvariableop_resource:I
7dnn_base_2_units_dense_5_matmul_readvariableop_resource:F
8dnn_base_2_units_dense_5_biasadd_readvariableop_resource:I
7dnn_base_2_units_dense_6_matmul_readvariableop_resource:F
8dnn_base_2_units_dense_6_biasadd_readvariableop_resource:I
7dnn_base_2_units_dense_7_matmul_readvariableop_resource:F
8dnn_base_2_units_dense_7_biasadd_readvariableop_resource:I
7dnn_base_2_units_dense_8_matmul_readvariableop_resource:F
8dnn_base_2_units_dense_8_biasadd_readvariableop_resource:
identity��/dnn_base_2-units/dense_3/BiasAdd/ReadVariableOp�.dnn_base_2-units/dense_3/MatMul/ReadVariableOp�/dnn_base_2-units/dense_4/BiasAdd/ReadVariableOp�.dnn_base_2-units/dense_4/MatMul/ReadVariableOp�/dnn_base_2-units/dense_5/BiasAdd/ReadVariableOp�.dnn_base_2-units/dense_5/MatMul/ReadVariableOp�/dnn_base_2-units/dense_6/BiasAdd/ReadVariableOp�.dnn_base_2-units/dense_6/MatMul/ReadVariableOp�/dnn_base_2-units/dense_7/BiasAdd/ReadVariableOp�.dnn_base_2-units/dense_7/MatMul/ReadVariableOp�/dnn_base_2-units/dense_8/BiasAdd/ReadVariableOp�.dnn_base_2-units/dense_8/MatMul/ReadVariableOp�
.dnn_base_2-units/dense_3/MatMul/ReadVariableOpReadVariableOp7dnn_base_2_units_dense_3_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
dnn_base_2-units/dense_3/MatMulMatMulinput_16dnn_base_2-units/dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
/dnn_base_2-units/dense_3/BiasAdd/ReadVariableOpReadVariableOp8dnn_base_2_units_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 dnn_base_2-units/dense_3/BiasAddBiasAdd)dnn_base_2-units/dense_3/MatMul:product:07dnn_base_2-units/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dnn_base_2-units/dense_3/ReluRelu)dnn_base_2-units/dense_3/BiasAdd:output:0*
T0*'
_output_shapes
:����������
.dnn_base_2-units/dense_4/MatMul/ReadVariableOpReadVariableOp7dnn_base_2_units_dense_4_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dnn_base_2-units/dense_4/MatMulMatMul+dnn_base_2-units/dense_3/Relu:activations:06dnn_base_2-units/dense_4/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
/dnn_base_2-units/dense_4/BiasAdd/ReadVariableOpReadVariableOp8dnn_base_2_units_dense_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 dnn_base_2-units/dense_4/BiasAddBiasAdd)dnn_base_2-units/dense_4/MatMul:product:07dnn_base_2-units/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dnn_base_2-units/dense_4/ReluRelu)dnn_base_2-units/dense_4/BiasAdd:output:0*
T0*'
_output_shapes
:����������
.dnn_base_2-units/dense_5/MatMul/ReadVariableOpReadVariableOp7dnn_base_2_units_dense_5_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dnn_base_2-units/dense_5/MatMulMatMul+dnn_base_2-units/dense_4/Relu:activations:06dnn_base_2-units/dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
/dnn_base_2-units/dense_5/BiasAdd/ReadVariableOpReadVariableOp8dnn_base_2_units_dense_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 dnn_base_2-units/dense_5/BiasAddBiasAdd)dnn_base_2-units/dense_5/MatMul:product:07dnn_base_2-units/dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dnn_base_2-units/dense_5/ReluRelu)dnn_base_2-units/dense_5/BiasAdd:output:0*
T0*'
_output_shapes
:����������
.dnn_base_2-units/dense_6/MatMul/ReadVariableOpReadVariableOp7dnn_base_2_units_dense_6_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dnn_base_2-units/dense_6/MatMulMatMul+dnn_base_2-units/dense_5/Relu:activations:06dnn_base_2-units/dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
/dnn_base_2-units/dense_6/BiasAdd/ReadVariableOpReadVariableOp8dnn_base_2_units_dense_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 dnn_base_2-units/dense_6/BiasAddBiasAdd)dnn_base_2-units/dense_6/MatMul:product:07dnn_base_2-units/dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dnn_base_2-units/dense_6/ReluRelu)dnn_base_2-units/dense_6/BiasAdd:output:0*
T0*'
_output_shapes
:����������
.dnn_base_2-units/dense_7/MatMul/ReadVariableOpReadVariableOp7dnn_base_2_units_dense_7_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dnn_base_2-units/dense_7/MatMulMatMul+dnn_base_2-units/dense_6/Relu:activations:06dnn_base_2-units/dense_7/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
/dnn_base_2-units/dense_7/BiasAdd/ReadVariableOpReadVariableOp8dnn_base_2_units_dense_7_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 dnn_base_2-units/dense_7/BiasAddBiasAdd)dnn_base_2-units/dense_7/MatMul:product:07dnn_base_2-units/dense_7/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dnn_base_2-units/dense_7/ReluRelu)dnn_base_2-units/dense_7/BiasAdd:output:0*
T0*'
_output_shapes
:����������
.dnn_base_2-units/dense_8/MatMul/ReadVariableOpReadVariableOp7dnn_base_2_units_dense_8_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dnn_base_2-units/dense_8/MatMulMatMul+dnn_base_2-units/dense_7/Relu:activations:06dnn_base_2-units/dense_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
/dnn_base_2-units/dense_8/BiasAdd/ReadVariableOpReadVariableOp8dnn_base_2_units_dense_8_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 dnn_base_2-units/dense_8/BiasAddBiasAdd)dnn_base_2-units/dense_8/MatMul:product:07dnn_base_2-units/dense_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
 dnn_base_2-units/dense_8/SigmoidSigmoid)dnn_base_2-units/dense_8/BiasAdd:output:0*
T0*'
_output_shapes
:���������s
IdentityIdentity$dnn_base_2-units/dense_8/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp0^dnn_base_2-units/dense_3/BiasAdd/ReadVariableOp/^dnn_base_2-units/dense_3/MatMul/ReadVariableOp0^dnn_base_2-units/dense_4/BiasAdd/ReadVariableOp/^dnn_base_2-units/dense_4/MatMul/ReadVariableOp0^dnn_base_2-units/dense_5/BiasAdd/ReadVariableOp/^dnn_base_2-units/dense_5/MatMul/ReadVariableOp0^dnn_base_2-units/dense_6/BiasAdd/ReadVariableOp/^dnn_base_2-units/dense_6/MatMul/ReadVariableOp0^dnn_base_2-units/dense_7/BiasAdd/ReadVariableOp/^dnn_base_2-units/dense_7/MatMul/ReadVariableOp0^dnn_base_2-units/dense_8/BiasAdd/ReadVariableOp/^dnn_base_2-units/dense_8/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:����������: : : : : : : : : : : : 2b
/dnn_base_2-units/dense_3/BiasAdd/ReadVariableOp/dnn_base_2-units/dense_3/BiasAdd/ReadVariableOp2`
.dnn_base_2-units/dense_3/MatMul/ReadVariableOp.dnn_base_2-units/dense_3/MatMul/ReadVariableOp2b
/dnn_base_2-units/dense_4/BiasAdd/ReadVariableOp/dnn_base_2-units/dense_4/BiasAdd/ReadVariableOp2`
.dnn_base_2-units/dense_4/MatMul/ReadVariableOp.dnn_base_2-units/dense_4/MatMul/ReadVariableOp2b
/dnn_base_2-units/dense_5/BiasAdd/ReadVariableOp/dnn_base_2-units/dense_5/BiasAdd/ReadVariableOp2`
.dnn_base_2-units/dense_5/MatMul/ReadVariableOp.dnn_base_2-units/dense_5/MatMul/ReadVariableOp2b
/dnn_base_2-units/dense_6/BiasAdd/ReadVariableOp/dnn_base_2-units/dense_6/BiasAdd/ReadVariableOp2`
.dnn_base_2-units/dense_6/MatMul/ReadVariableOp.dnn_base_2-units/dense_6/MatMul/ReadVariableOp2b
/dnn_base_2-units/dense_7/BiasAdd/ReadVariableOp/dnn_base_2-units/dense_7/BiasAdd/ReadVariableOp2`
.dnn_base_2-units/dense_7/MatMul/ReadVariableOp.dnn_base_2-units/dense_7/MatMul/ReadVariableOp2b
/dnn_base_2-units/dense_8/BiasAdd/ReadVariableOp/dnn_base_2-units/dense_8/BiasAdd/ReadVariableOp2`
.dnn_base_2-units/dense_8/MatMul/ReadVariableOp.dnn_base_2-units/dense_8/MatMul/ReadVariableOp:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1
�

�
B__inference_dense_4_layer_call_and_return_conditional_losses_39390

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
B__inference_dense_3_layer_call_and_return_conditional_losses_38996

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
� 
�
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39238
input_1 
dense_3_39207:	�
dense_3_39209:
dense_4_39212:
dense_4_39214:
dense_5_39217:
dense_5_39219:
dense_6_39222:
dense_6_39224:
dense_7_39227:
dense_7_39229:
dense_8_39232:
dense_8_39234:
identity��dense_3/StatefulPartitionedCall�dense_4/StatefulPartitionedCall�dense_5/StatefulPartitionedCall�dense_6/StatefulPartitionedCall�dense_7/StatefulPartitionedCall�dense_8/StatefulPartitionedCall�
dense_3/StatefulPartitionedCallStatefulPartitionedCallinput_1dense_3_39207dense_3_39209*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_38996�
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_39212dense_4_39214*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_39013�
dense_5/StatefulPartitionedCallStatefulPartitionedCall(dense_4/StatefulPartitionedCall:output:0dense_5_39217dense_5_39219*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_39030�
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_39222dense_6_39224*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_39047�
dense_7/StatefulPartitionedCallStatefulPartitionedCall(dense_6/StatefulPartitionedCall:output:0dense_7_39227dense_7_39229*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_7_layer_call_and_return_conditional_losses_39064�
dense_8/StatefulPartitionedCallStatefulPartitionedCall(dense_7/StatefulPartitionedCall:output:0dense_8_39232dense_8_39234*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_8_layer_call_and_return_conditional_losses_39081w
IdentityIdentity(dense_8/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall ^dense_7/StatefulPartitionedCall ^dense_8/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:����������: : : : : : : : : : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2B
dense_7/StatefulPartitionedCalldense_7/StatefulPartitionedCall2B
dense_8/StatefulPartitionedCalldense_8/StatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1
�4
�	
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39350

inputs9
&dense_3_matmul_readvariableop_resource:	�5
'dense_3_biasadd_readvariableop_resource:8
&dense_4_matmul_readvariableop_resource:5
'dense_4_biasadd_readvariableop_resource:8
&dense_5_matmul_readvariableop_resource:5
'dense_5_biasadd_readvariableop_resource:8
&dense_6_matmul_readvariableop_resource:5
'dense_6_biasadd_readvariableop_resource:8
&dense_7_matmul_readvariableop_resource:5
'dense_7_biasadd_readvariableop_resource:8
&dense_8_matmul_readvariableop_resource:5
'dense_8_biasadd_readvariableop_resource:
identity��dense_3/BiasAdd/ReadVariableOp�dense_3/MatMul/ReadVariableOp�dense_4/BiasAdd/ReadVariableOp�dense_4/MatMul/ReadVariableOp�dense_5/BiasAdd/ReadVariableOp�dense_5/MatMul/ReadVariableOp�dense_6/BiasAdd/ReadVariableOp�dense_6/MatMul/ReadVariableOp�dense_7/BiasAdd/ReadVariableOp�dense_7/MatMul/ReadVariableOp�dense_8/BiasAdd/ReadVariableOp�dense_8/MatMul/ReadVariableOp�
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0y
dense_3/MatMulMatMulinputs%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������`
dense_3/ReluReludense_3/BiasAdd:output:0*
T0*'
_output_shapes
:����������
dense_4/MatMul/ReadVariableOpReadVariableOp&dense_4_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dense_4/MatMulMatMuldense_3/Relu:activations:0%dense_4/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense_4/BiasAddBiasAdddense_4/MatMul:product:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������`
dense_4/ReluReludense_4/BiasAdd:output:0*
T0*'
_output_shapes
:����������
dense_5/MatMul/ReadVariableOpReadVariableOp&dense_5_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dense_5/MatMulMatMuldense_4/Relu:activations:0%dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense_5/BiasAdd/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense_5/BiasAddBiasAdddense_5/MatMul:product:0&dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������`
dense_5/ReluReludense_5/BiasAdd:output:0*
T0*'
_output_shapes
:����������
dense_6/MatMul/ReadVariableOpReadVariableOp&dense_6_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dense_6/MatMulMatMuldense_5/Relu:activations:0%dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense_6/BiasAdd/ReadVariableOpReadVariableOp'dense_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense_6/BiasAddBiasAdddense_6/MatMul:product:0&dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������`
dense_6/ReluReludense_6/BiasAdd:output:0*
T0*'
_output_shapes
:����������
dense_7/MatMul/ReadVariableOpReadVariableOp&dense_7_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dense_7/MatMulMatMuldense_6/Relu:activations:0%dense_7/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense_7/BiasAdd/ReadVariableOpReadVariableOp'dense_7_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense_7/BiasAddBiasAdddense_7/MatMul:product:0&dense_7/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������`
dense_7/ReluReludense_7/BiasAdd:output:0*
T0*'
_output_shapes
:����������
dense_8/MatMul/ReadVariableOpReadVariableOp&dense_8_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
dense_8/MatMulMatMuldense_7/Relu:activations:0%dense_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense_8/BiasAdd/ReadVariableOpReadVariableOp'dense_8_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense_8/BiasAddBiasAdddense_8/MatMul:product:0&dense_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������f
dense_8/SigmoidSigmoiddense_8/BiasAdd:output:0*
T0*'
_output_shapes
:���������b
IdentityIdentitydense_8/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp^dense_4/MatMul/ReadVariableOp^dense_5/BiasAdd/ReadVariableOp^dense_5/MatMul/ReadVariableOp^dense_6/BiasAdd/ReadVariableOp^dense_6/MatMul/ReadVariableOp^dense_7/BiasAdd/ReadVariableOp^dense_7/MatMul/ReadVariableOp^dense_8/BiasAdd/ReadVariableOp^dense_8/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:����������: : : : : : : : : : : : 2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2>
dense_4/MatMul/ReadVariableOpdense_4/MatMul/ReadVariableOp2@
dense_5/BiasAdd/ReadVariableOpdense_5/BiasAdd/ReadVariableOp2>
dense_5/MatMul/ReadVariableOpdense_5/MatMul/ReadVariableOp2@
dense_6/BiasAdd/ReadVariableOpdense_6/BiasAdd/ReadVariableOp2>
dense_6/MatMul/ReadVariableOpdense_6/MatMul/ReadVariableOp2@
dense_7/BiasAdd/ReadVariableOpdense_7/BiasAdd/ReadVariableOp2>
dense_7/MatMul/ReadVariableOpdense_7/MatMul/ReadVariableOp2@
dense_8/BiasAdd/ReadVariableOpdense_8/BiasAdd/ReadVariableOp2>
dense_8/MatMul/ReadVariableOpdense_8/MatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
B__inference_dense_8_layer_call_and_return_conditional_losses_39081

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
0__inference_dnn_base_2-units_layer_call_fn_39115
input_1
unknown:	�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8� *T
fORM
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39088o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:����������: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1
�

�
B__inference_dense_5_layer_call_and_return_conditional_losses_39410

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
#__inference_signature_wrapper_39275
input_1
unknown:	�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8� *)
f$R"
 __inference__wrapped_model_38978o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:����������: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1
�`
�
__inference__traced_save_39628
file_prefix>
:savev2_dnn_base_2_units_dense_3_kernel_read_readvariableop<
8savev2_dnn_base_2_units_dense_3_bias_read_readvariableop>
:savev2_dnn_base_2_units_dense_4_kernel_read_readvariableop<
8savev2_dnn_base_2_units_dense_4_bias_read_readvariableop>
:savev2_dnn_base_2_units_dense_5_kernel_read_readvariableop<
8savev2_dnn_base_2_units_dense_5_bias_read_readvariableop>
:savev2_dnn_base_2_units_dense_6_kernel_read_readvariableop<
8savev2_dnn_base_2_units_dense_6_bias_read_readvariableop>
:savev2_dnn_base_2_units_dense_7_kernel_read_readvariableop<
8savev2_dnn_base_2_units_dense_7_bias_read_readvariableop>
:savev2_dnn_base_2_units_dense_8_kernel_read_readvariableop<
8savev2_dnn_base_2_units_dense_8_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_3_kernel_m_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_3_bias_m_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_4_kernel_m_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_4_bias_m_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_5_kernel_m_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_5_bias_m_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_6_kernel_m_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_6_bias_m_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_7_kernel_m_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_7_bias_m_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_8_kernel_m_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_8_bias_m_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_3_kernel_v_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_3_bias_v_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_4_kernel_v_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_4_bias_v_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_5_kernel_v_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_5_bias_v_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_6_kernel_v_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_6_bias_v_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_7_kernel_v_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_7_bias_v_read_readvariableopE
Asavev2_adam_dnn_base_2_units_dense_8_kernel_v_read_readvariableopC
?savev2_adam_dnn_base_2_units_dense_8_bias_v_read_readvariableop
savev2_const

identity_1��MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*�
value�B�.B(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense4/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense5/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense5/bias/.ATTRIBUTES/VARIABLE_VALUEB.output_layer/kernel/.ATTRIBUTES/VARIABLE_VALUEB,output_layer/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0:savev2_dnn_base_2_units_dense_3_kernel_read_readvariableop8savev2_dnn_base_2_units_dense_3_bias_read_readvariableop:savev2_dnn_base_2_units_dense_4_kernel_read_readvariableop8savev2_dnn_base_2_units_dense_4_bias_read_readvariableop:savev2_dnn_base_2_units_dense_5_kernel_read_readvariableop8savev2_dnn_base_2_units_dense_5_bias_read_readvariableop:savev2_dnn_base_2_units_dense_6_kernel_read_readvariableop8savev2_dnn_base_2_units_dense_6_bias_read_readvariableop:savev2_dnn_base_2_units_dense_7_kernel_read_readvariableop8savev2_dnn_base_2_units_dense_7_bias_read_readvariableop:savev2_dnn_base_2_units_dense_8_kernel_read_readvariableop8savev2_dnn_base_2_units_dense_8_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_3_kernel_m_read_readvariableop?savev2_adam_dnn_base_2_units_dense_3_bias_m_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_4_kernel_m_read_readvariableop?savev2_adam_dnn_base_2_units_dense_4_bias_m_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_5_kernel_m_read_readvariableop?savev2_adam_dnn_base_2_units_dense_5_bias_m_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_6_kernel_m_read_readvariableop?savev2_adam_dnn_base_2_units_dense_6_bias_m_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_7_kernel_m_read_readvariableop?savev2_adam_dnn_base_2_units_dense_7_bias_m_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_8_kernel_m_read_readvariableop?savev2_adam_dnn_base_2_units_dense_8_bias_m_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_3_kernel_v_read_readvariableop?savev2_adam_dnn_base_2_units_dense_3_bias_v_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_4_kernel_v_read_readvariableop?savev2_adam_dnn_base_2_units_dense_4_bias_v_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_5_kernel_v_read_readvariableop?savev2_adam_dnn_base_2_units_dense_5_bias_v_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_6_kernel_v_read_readvariableop?savev2_adam_dnn_base_2_units_dense_6_bias_v_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_7_kernel_v_read_readvariableop?savev2_adam_dnn_base_2_units_dense_7_bias_v_read_readvariableopAsavev2_adam_dnn_base_2_units_dense_8_kernel_v_read_readvariableop?savev2_adam_dnn_base_2_units_dense_8_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *<
dtypes2
02.	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*�
_input_shapes�
�: :	�:::::::::::: : : : : : : : : :	�::::::::::::	�:::::::::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	�: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$	 

_output_shapes

:: 


_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :%!

_output_shapes
:	�: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$  

_output_shapes

:: !

_output_shapes
::%"!

_output_shapes
:	�: #

_output_shapes
::$$ 

_output_shapes

:: %

_output_shapes
::$& 

_output_shapes

:: '

_output_shapes
::$( 

_output_shapes

:: )

_output_shapes
::$* 

_output_shapes

:: +

_output_shapes
::$, 

_output_shapes

:: -

_output_shapes
::.

_output_shapes
: 
��
�
!__inference__traced_restore_39773
file_prefixC
0assignvariableop_dnn_base_2_units_dense_3_kernel:	�>
0assignvariableop_1_dnn_base_2_units_dense_3_bias:D
2assignvariableop_2_dnn_base_2_units_dense_4_kernel:>
0assignvariableop_3_dnn_base_2_units_dense_4_bias:D
2assignvariableop_4_dnn_base_2_units_dense_5_kernel:>
0assignvariableop_5_dnn_base_2_units_dense_5_bias:D
2assignvariableop_6_dnn_base_2_units_dense_6_kernel:>
0assignvariableop_7_dnn_base_2_units_dense_6_bias:D
2assignvariableop_8_dnn_base_2_units_dense_7_kernel:>
0assignvariableop_9_dnn_base_2_units_dense_7_bias:E
3assignvariableop_10_dnn_base_2_units_dense_8_kernel:?
1assignvariableop_11_dnn_base_2_units_dense_8_bias:'
assignvariableop_12_adam_iter:	 )
assignvariableop_13_adam_beta_1: )
assignvariableop_14_adam_beta_2: (
assignvariableop_15_adam_decay: 0
&assignvariableop_16_adam_learning_rate: #
assignvariableop_17_total: #
assignvariableop_18_count: %
assignvariableop_19_total_1: %
assignvariableop_20_count_1: M
:assignvariableop_21_adam_dnn_base_2_units_dense_3_kernel_m:	�F
8assignvariableop_22_adam_dnn_base_2_units_dense_3_bias_m:L
:assignvariableop_23_adam_dnn_base_2_units_dense_4_kernel_m:F
8assignvariableop_24_adam_dnn_base_2_units_dense_4_bias_m:L
:assignvariableop_25_adam_dnn_base_2_units_dense_5_kernel_m:F
8assignvariableop_26_adam_dnn_base_2_units_dense_5_bias_m:L
:assignvariableop_27_adam_dnn_base_2_units_dense_6_kernel_m:F
8assignvariableop_28_adam_dnn_base_2_units_dense_6_bias_m:L
:assignvariableop_29_adam_dnn_base_2_units_dense_7_kernel_m:F
8assignvariableop_30_adam_dnn_base_2_units_dense_7_bias_m:L
:assignvariableop_31_adam_dnn_base_2_units_dense_8_kernel_m:F
8assignvariableop_32_adam_dnn_base_2_units_dense_8_bias_m:M
:assignvariableop_33_adam_dnn_base_2_units_dense_3_kernel_v:	�F
8assignvariableop_34_adam_dnn_base_2_units_dense_3_bias_v:L
:assignvariableop_35_adam_dnn_base_2_units_dense_4_kernel_v:F
8assignvariableop_36_adam_dnn_base_2_units_dense_4_bias_v:L
:assignvariableop_37_adam_dnn_base_2_units_dense_5_kernel_v:F
8assignvariableop_38_adam_dnn_base_2_units_dense_5_bias_v:L
:assignvariableop_39_adam_dnn_base_2_units_dense_6_kernel_v:F
8assignvariableop_40_adam_dnn_base_2_units_dense_6_bias_v:L
:assignvariableop_41_adam_dnn_base_2_units_dense_7_kernel_v:F
8assignvariableop_42_adam_dnn_base_2_units_dense_7_bias_v:L
:assignvariableop_43_adam_dnn_base_2_units_dense_8_kernel_v:F
8assignvariableop_44_adam_dnn_base_2_units_dense_8_bias_v:
identity_46��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_44�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*�
value�B�.B(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense4/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense5/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense5/bias/.ATTRIBUTES/VARIABLE_VALUEB.output_layer/kernel/.ATTRIBUTES/VARIABLE_VALUEB,output_layer/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::::::::*<
dtypes2
02.	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp0assignvariableop_dnn_base_2_units_dense_3_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp0assignvariableop_1_dnn_base_2_units_dense_3_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp2assignvariableop_2_dnn_base_2_units_dense_4_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp0assignvariableop_3_dnn_base_2_units_dense_4_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp2assignvariableop_4_dnn_base_2_units_dense_5_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp0assignvariableop_5_dnn_base_2_units_dense_5_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp2assignvariableop_6_dnn_base_2_units_dense_6_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp0assignvariableop_7_dnn_base_2_units_dense_6_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp2assignvariableop_8_dnn_base_2_units_dense_7_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp0assignvariableop_9_dnn_base_2_units_dense_7_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp3assignvariableop_10_dnn_base_2_units_dense_8_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp1assignvariableop_11_dnn_base_2_units_dense_8_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_iterIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOpassignvariableop_13_adam_beta_1Identity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOpassignvariableop_14_adam_beta_2Identity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOpassignvariableop_15_adam_decayIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOp&assignvariableop_16_adam_learning_rateIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOpassignvariableop_17_totalIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOpassignvariableop_18_countIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOpassignvariableop_19_total_1Identity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOpassignvariableop_20_count_1Identity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp:assignvariableop_21_adam_dnn_base_2_units_dense_3_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp8assignvariableop_22_adam_dnn_base_2_units_dense_3_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp:assignvariableop_23_adam_dnn_base_2_units_dense_4_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp8assignvariableop_24_adam_dnn_base_2_units_dense_4_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp:assignvariableop_25_adam_dnn_base_2_units_dense_5_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp8assignvariableop_26_adam_dnn_base_2_units_dense_5_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp:assignvariableop_27_adam_dnn_base_2_units_dense_6_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp8assignvariableop_28_adam_dnn_base_2_units_dense_6_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp:assignvariableop_29_adam_dnn_base_2_units_dense_7_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp8assignvariableop_30_adam_dnn_base_2_units_dense_7_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp:assignvariableop_31_adam_dnn_base_2_units_dense_8_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp8assignvariableop_32_adam_dnn_base_2_units_dense_8_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOp:assignvariableop_33_adam_dnn_base_2_units_dense_3_kernel_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOp8assignvariableop_34_adam_dnn_base_2_units_dense_3_bias_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOp:assignvariableop_35_adam_dnn_base_2_units_dense_4_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOp8assignvariableop_36_adam_dnn_base_2_units_dense_4_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOp:assignvariableop_37_adam_dnn_base_2_units_dense_5_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOp8assignvariableop_38_adam_dnn_base_2_units_dense_5_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOp:assignvariableop_39_adam_dnn_base_2_units_dense_6_kernel_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_40AssignVariableOp8assignvariableop_40_adam_dnn_base_2_units_dense_6_bias_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_41AssignVariableOp:assignvariableop_41_adam_dnn_base_2_units_dense_7_kernel_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_42AssignVariableOp8assignvariableop_42_adam_dnn_base_2_units_dense_7_bias_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_43AssignVariableOp:assignvariableop_43_adam_dnn_base_2_units_dense_8_kernel_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_44AssignVariableOp8assignvariableop_44_adam_dnn_base_2_units_dense_8_bias_vIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �
Identity_45Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_46IdentityIdentity_45:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_46Identity_46:output:0*o
_input_shapes^
\: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�

�
B__inference_dense_3_layer_call_and_return_conditional_losses_39370

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
'__inference_dense_7_layer_call_fn_39439

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_7_layer_call_and_return_conditional_losses_39064o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
B__inference_dense_6_layer_call_and_return_conditional_losses_39430

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
� 
�
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39088

inputs 
dense_3_38997:	�
dense_3_38999:
dense_4_39014:
dense_4_39016:
dense_5_39031:
dense_5_39033:
dense_6_39048:
dense_6_39050:
dense_7_39065:
dense_7_39067:
dense_8_39082:
dense_8_39084:
identity��dense_3/StatefulPartitionedCall�dense_4/StatefulPartitionedCall�dense_5/StatefulPartitionedCall�dense_6/StatefulPartitionedCall�dense_7/StatefulPartitionedCall�dense_8/StatefulPartitionedCall�
dense_3/StatefulPartitionedCallStatefulPartitionedCallinputsdense_3_38997dense_3_38999*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_38996�
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_39014dense_4_39016*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_39013�
dense_5/StatefulPartitionedCallStatefulPartitionedCall(dense_4/StatefulPartitionedCall:output:0dense_5_39031dense_5_39033*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_39030�
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_39048dense_6_39050*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_39047�
dense_7/StatefulPartitionedCallStatefulPartitionedCall(dense_6/StatefulPartitionedCall:output:0dense_7_39065dense_7_39067*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_7_layer_call_and_return_conditional_losses_39064�
dense_8/StatefulPartitionedCallStatefulPartitionedCall(dense_7/StatefulPartitionedCall:output:0dense_8_39082dense_8_39084*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_8_layer_call_and_return_conditional_losses_39081w
IdentityIdentity(dense_8/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall ^dense_7/StatefulPartitionedCall ^dense_8/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:����������: : : : : : : : : : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2B
dense_7/StatefulPartitionedCalldense_7/StatefulPartitionedCall2B
dense_8/StatefulPartitionedCalldense_8/StatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
0__inference_dnn_base_2-units_layer_call_fn_39304

inputs
unknown:	�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8� *T
fORM
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39088o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:����������: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
B__inference_dense_8_layer_call_and_return_conditional_losses_39470

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
'__inference_dense_5_layer_call_fn_39399

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8� *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_39030o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
<
input_11
serving_default_input_1:0����������<
output_10
StatefulPartitionedCall:0���������tensorflow/serving/predict:�v
�

dense1

dense2

dense3

dense4

dense5
output_layer
	optimizer
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
|__call__
*}&call_and_return_all_conditional_losses
~_default_save_signature"
_tf_keras_model
�

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

kernel
 bias
!	variables
"trainable_variables
#regularization_losses
$	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

%kernel
&bias
'	variables
(trainable_variables
)regularization_losses
*	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

+kernel
,bias
-	variables
.trainable_variables
/regularization_losses
0	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
1iter

2beta_1

3beta_2
	4decay
5learning_ratemdmemfmgmhmimj mk%ml&mm+mn,movpvqvrvsvtvuvv vw%vx&vy+vz,v{"
	optimizer
v
0
1
2
3
4
5
6
 7
%8
&9
+10
,11"
trackable_list_wrapper
v
0
1
2
3
4
5
6
 7
%8
&9
+10
,11"
trackable_list_wrapper
 "
trackable_list_wrapper
�
6non_trainable_variables

7layers
8metrics
9layer_regularization_losses
:layer_metrics
	variables
	trainable_variables

regularization_losses
|__call__
~_default_save_signature
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses"
_generic_user_object
-
�serving_default"
signature_map
2:0	�2dnn_base_2-units/dense_3/kernel
+:)2dnn_base_2-units/dense_3/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
;non_trainable_variables

<layers
=metrics
>layer_regularization_losses
?layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
1:/2dnn_base_2-units/dense_4/kernel
+:)2dnn_base_2-units/dense_4/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
@non_trainable_variables

Alayers
Bmetrics
Clayer_regularization_losses
Dlayer_metrics
	variables
trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
1:/2dnn_base_2-units/dense_5/kernel
+:)2dnn_base_2-units/dense_5/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Enon_trainable_variables

Flayers
Gmetrics
Hlayer_regularization_losses
Ilayer_metrics
	variables
trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
1:/2dnn_base_2-units/dense_6/kernel
+:)2dnn_base_2-units/dense_6/bias
.
0
 1"
trackable_list_wrapper
.
0
 1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
!	variables
"trainable_variables
#regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
1:/2dnn_base_2-units/dense_7/kernel
+:)2dnn_base_2-units/dense_7/bias
.
%0
&1"
trackable_list_wrapper
.
%0
&1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Onon_trainable_variables

Players
Qmetrics
Rlayer_regularization_losses
Slayer_metrics
'	variables
(trainable_variables
)regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
1:/2dnn_base_2-units/dense_8/kernel
+:)2dnn_base_2-units/dense_8/bias
.
+0
,1"
trackable_list_wrapper
.
+0
,1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Tnon_trainable_variables

Ulayers
Vmetrics
Wlayer_regularization_losses
Xlayer_metrics
-	variables
.trainable_variables
/regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
 "
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
.
Y0
Z1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
N
	[total
	\count
]	variables
^	keras_api"
_tf_keras_metric
^
	_total
	`count
a
_fn_kwargs
b	variables
c	keras_api"
_tf_keras_metric
:  (2total
:  (2count
.
[0
\1"
trackable_list_wrapper
-
]	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
_0
`1"
trackable_list_wrapper
-
b	variables"
_generic_user_object
7:5	�2&Adam/dnn_base_2-units/dense_3/kernel/m
0:.2$Adam/dnn_base_2-units/dense_3/bias/m
6:42&Adam/dnn_base_2-units/dense_4/kernel/m
0:.2$Adam/dnn_base_2-units/dense_4/bias/m
6:42&Adam/dnn_base_2-units/dense_5/kernel/m
0:.2$Adam/dnn_base_2-units/dense_5/bias/m
6:42&Adam/dnn_base_2-units/dense_6/kernel/m
0:.2$Adam/dnn_base_2-units/dense_6/bias/m
6:42&Adam/dnn_base_2-units/dense_7/kernel/m
0:.2$Adam/dnn_base_2-units/dense_7/bias/m
6:42&Adam/dnn_base_2-units/dense_8/kernel/m
0:.2$Adam/dnn_base_2-units/dense_8/bias/m
7:5	�2&Adam/dnn_base_2-units/dense_3/kernel/v
0:.2$Adam/dnn_base_2-units/dense_3/bias/v
6:42&Adam/dnn_base_2-units/dense_4/kernel/v
0:.2$Adam/dnn_base_2-units/dense_4/bias/v
6:42&Adam/dnn_base_2-units/dense_5/kernel/v
0:.2$Adam/dnn_base_2-units/dense_5/bias/v
6:42&Adam/dnn_base_2-units/dense_6/kernel/v
0:.2$Adam/dnn_base_2-units/dense_6/bias/v
6:42&Adam/dnn_base_2-units/dense_7/kernel/v
0:.2$Adam/dnn_base_2-units/dense_7/bias/v
6:42&Adam/dnn_base_2-units/dense_8/kernel/v
0:.2$Adam/dnn_base_2-units/dense_8/bias/v
�2�
0__inference_dnn_base_2-units_layer_call_fn_39115
0__inference_dnn_base_2-units_layer_call_fn_39304�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39350
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39238�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
 __inference__wrapped_model_38978input_1"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_dense_3_layer_call_fn_39359�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_dense_3_layer_call_and_return_conditional_losses_39370�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_dense_4_layer_call_fn_39379�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_dense_4_layer_call_and_return_conditional_losses_39390�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_dense_5_layer_call_fn_39399�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_dense_5_layer_call_and_return_conditional_losses_39410�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_dense_6_layer_call_fn_39419�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_dense_6_layer_call_and_return_conditional_losses_39430�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_dense_7_layer_call_fn_39439�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_dense_7_layer_call_and_return_conditional_losses_39450�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_dense_8_layer_call_fn_39459�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_dense_8_layer_call_and_return_conditional_losses_39470�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference_signature_wrapper_39275input_1"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
 __inference__wrapped_model_38978v %&+,1�.
'�$
"�
input_1����������
� "3�0
.
output_1"�
output_1����������
B__inference_dense_3_layer_call_and_return_conditional_losses_39370]0�-
&�#
!�
inputs����������
� "%�"
�
0���������
� {
'__inference_dense_3_layer_call_fn_39359P0�-
&�#
!�
inputs����������
� "�����������
B__inference_dense_4_layer_call_and_return_conditional_losses_39390\/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� z
'__inference_dense_4_layer_call_fn_39379O/�,
%�"
 �
inputs���������
� "�����������
B__inference_dense_5_layer_call_and_return_conditional_losses_39410\/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� z
'__inference_dense_5_layer_call_fn_39399O/�,
%�"
 �
inputs���������
� "�����������
B__inference_dense_6_layer_call_and_return_conditional_losses_39430\ /�,
%�"
 �
inputs���������
� "%�"
�
0���������
� z
'__inference_dense_6_layer_call_fn_39419O /�,
%�"
 �
inputs���������
� "�����������
B__inference_dense_7_layer_call_and_return_conditional_losses_39450\%&/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� z
'__inference_dense_7_layer_call_fn_39439O%&/�,
%�"
 �
inputs���������
� "�����������
B__inference_dense_8_layer_call_and_return_conditional_losses_39470\+,/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� z
'__inference_dense_8_layer_call_fn_39459O+,/�,
%�"
 �
inputs���������
� "�����������
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39238h %&+,1�.
'�$
"�
input_1����������
� "%�"
�
0���������
� �
K__inference_dnn_base_2-units_layer_call_and_return_conditional_losses_39350g %&+,0�-
&�#
!�
inputs����������
� "%�"
�
0���������
� �
0__inference_dnn_base_2-units_layer_call_fn_39115[ %&+,1�.
'�$
"�
input_1����������
� "�����������
0__inference_dnn_base_2-units_layer_call_fn_39304Z %&+,0�-
&�#
!�
inputs����������
� "�����������
#__inference_signature_wrapper_39275� %&+,<�9
� 
2�/
-
input_1"�
input_1����������"3�0
.
output_1"�
output_1���������
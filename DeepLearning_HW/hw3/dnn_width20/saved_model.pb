??
??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
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
delete_old_dirsbool(?
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
dtypetype?
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
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
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
?
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
executor_typestring ??
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
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.7.02v2.7.0-rc1-69-gc256c071bb28??
?
!dnn_base_20-units/dense_15/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*2
shared_name#!dnn_base_20-units/dense_15/kernel
?
5dnn_base_20-units/dense_15/kernel/Read/ReadVariableOpReadVariableOp!dnn_base_20-units/dense_15/kernel*
_output_shapes
:	?*
dtype0
?
dnn_base_20-units/dense_15/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!dnn_base_20-units/dense_15/bias
?
3dnn_base_20-units/dense_15/bias/Read/ReadVariableOpReadVariableOpdnn_base_20-units/dense_15/bias*
_output_shapes
:*
dtype0
?
!dnn_base_20-units/dense_16/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*2
shared_name#!dnn_base_20-units/dense_16/kernel
?
5dnn_base_20-units/dense_16/kernel/Read/ReadVariableOpReadVariableOp!dnn_base_20-units/dense_16/kernel*
_output_shapes

:*
dtype0
?
dnn_base_20-units/dense_16/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!dnn_base_20-units/dense_16/bias
?
3dnn_base_20-units/dense_16/bias/Read/ReadVariableOpReadVariableOpdnn_base_20-units/dense_16/bias*
_output_shapes
:*
dtype0
?
!dnn_base_20-units/dense_17/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*2
shared_name#!dnn_base_20-units/dense_17/kernel
?
5dnn_base_20-units/dense_17/kernel/Read/ReadVariableOpReadVariableOp!dnn_base_20-units/dense_17/kernel*
_output_shapes

:*
dtype0
?
dnn_base_20-units/dense_17/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!dnn_base_20-units/dense_17/bias
?
3dnn_base_20-units/dense_17/bias/Read/ReadVariableOpReadVariableOpdnn_base_20-units/dense_17/bias*
_output_shapes
:*
dtype0
?
!dnn_base_20-units/dense_18/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*2
shared_name#!dnn_base_20-units/dense_18/kernel
?
5dnn_base_20-units/dense_18/kernel/Read/ReadVariableOpReadVariableOp!dnn_base_20-units/dense_18/kernel*
_output_shapes

:*
dtype0
?
dnn_base_20-units/dense_18/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!dnn_base_20-units/dense_18/bias
?
3dnn_base_20-units/dense_18/bias/Read/ReadVariableOpReadVariableOpdnn_base_20-units/dense_18/bias*
_output_shapes
:*
dtype0
?
!dnn_base_20-units/dense_19/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*2
shared_name#!dnn_base_20-units/dense_19/kernel
?
5dnn_base_20-units/dense_19/kernel/Read/ReadVariableOpReadVariableOp!dnn_base_20-units/dense_19/kernel*
_output_shapes

:*
dtype0
?
dnn_base_20-units/dense_19/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!dnn_base_20-units/dense_19/bias
?
3dnn_base_20-units/dense_19/bias/Read/ReadVariableOpReadVariableOpdnn_base_20-units/dense_19/bias*
_output_shapes
:*
dtype0
?
!dnn_base_20-units/dense_20/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*2
shared_name#!dnn_base_20-units/dense_20/kernel
?
5dnn_base_20-units/dense_20/kernel/Read/ReadVariableOpReadVariableOp!dnn_base_20-units/dense_20/kernel*
_output_shapes

:*
dtype0
?
dnn_base_20-units/dense_20/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!dnn_base_20-units/dense_20/bias
?
3dnn_base_20-units/dense_20/bias/Read/ReadVariableOpReadVariableOpdnn_base_20-units/dense_20/bias*
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
?
(Adam/dnn_base_20-units/dense_15/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*9
shared_name*(Adam/dnn_base_20-units/dense_15/kernel/m
?
<Adam/dnn_base_20-units/dense_15/kernel/m/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_15/kernel/m*
_output_shapes
:	?*
dtype0
?
&Adam/dnn_base_20-units/dense_15/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_15/bias/m
?
:Adam/dnn_base_20-units/dense_15/bias/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_15/bias/m*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_16/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_16/kernel/m
?
<Adam/dnn_base_20-units/dense_16/kernel/m/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_16/kernel/m*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_16/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_16/bias/m
?
:Adam/dnn_base_20-units/dense_16/bias/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_16/bias/m*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_17/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_17/kernel/m
?
<Adam/dnn_base_20-units/dense_17/kernel/m/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_17/kernel/m*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_17/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_17/bias/m
?
:Adam/dnn_base_20-units/dense_17/bias/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_17/bias/m*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_18/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_18/kernel/m
?
<Adam/dnn_base_20-units/dense_18/kernel/m/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_18/kernel/m*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_18/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_18/bias/m
?
:Adam/dnn_base_20-units/dense_18/bias/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_18/bias/m*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_19/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_19/kernel/m
?
<Adam/dnn_base_20-units/dense_19/kernel/m/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_19/kernel/m*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_19/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_19/bias/m
?
:Adam/dnn_base_20-units/dense_19/bias/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_19/bias/m*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_20/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_20/kernel/m
?
<Adam/dnn_base_20-units/dense_20/kernel/m/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_20/kernel/m*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_20/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_20/bias/m
?
:Adam/dnn_base_20-units/dense_20/bias/m/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_20/bias/m*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_15/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*9
shared_name*(Adam/dnn_base_20-units/dense_15/kernel/v
?
<Adam/dnn_base_20-units/dense_15/kernel/v/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_15/kernel/v*
_output_shapes
:	?*
dtype0
?
&Adam/dnn_base_20-units/dense_15/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_15/bias/v
?
:Adam/dnn_base_20-units/dense_15/bias/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_15/bias/v*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_16/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_16/kernel/v
?
<Adam/dnn_base_20-units/dense_16/kernel/v/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_16/kernel/v*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_16/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_16/bias/v
?
:Adam/dnn_base_20-units/dense_16/bias/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_16/bias/v*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_17/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_17/kernel/v
?
<Adam/dnn_base_20-units/dense_17/kernel/v/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_17/kernel/v*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_17/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_17/bias/v
?
:Adam/dnn_base_20-units/dense_17/bias/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_17/bias/v*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_18/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_18/kernel/v
?
<Adam/dnn_base_20-units/dense_18/kernel/v/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_18/kernel/v*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_18/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_18/bias/v
?
:Adam/dnn_base_20-units/dense_18/bias/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_18/bias/v*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_19/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_19/kernel/v
?
<Adam/dnn_base_20-units/dense_19/kernel/v/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_19/kernel/v*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_19/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_19/bias/v
?
:Adam/dnn_base_20-units/dense_19/bias/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_19/bias/v*
_output_shapes
:*
dtype0
?
(Adam/dnn_base_20-units/dense_20/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*9
shared_name*(Adam/dnn_base_20-units/dense_20/kernel/v
?
<Adam/dnn_base_20-units/dense_20/kernel/v/Read/ReadVariableOpReadVariableOp(Adam/dnn_base_20-units/dense_20/kernel/v*
_output_shapes

:*
dtype0
?
&Adam/dnn_base_20-units/dense_20/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dnn_base_20-units/dense_20/bias/v
?
:Adam/dnn_base_20-units/dense_20/bias/v/Read/ReadVariableOpReadVariableOp&Adam/dnn_base_20-units/dense_20/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
??
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*??
value??B?? B??
?

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
?
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
?
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
_]
VARIABLE_VALUE!dnn_base_20-units/dense_15/kernel(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEdnn_base_20-units/dense_15/bias&dense1/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
?
;non_trainable_variables

<layers
=metrics
>layer_regularization_losses
?layer_metrics
	variables
trainable_variables
regularization_losses
_]
VARIABLE_VALUE!dnn_base_20-units/dense_16/kernel(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEdnn_base_20-units/dense_16/bias&dense2/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
?
@non_trainable_variables

Alayers
Bmetrics
Clayer_regularization_losses
Dlayer_metrics
	variables
trainable_variables
regularization_losses
_]
VARIABLE_VALUE!dnn_base_20-units/dense_17/kernel(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEdnn_base_20-units/dense_17/bias&dense3/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
?
Enon_trainable_variables

Flayers
Gmetrics
Hlayer_regularization_losses
Ilayer_metrics
	variables
trainable_variables
regularization_losses
_]
VARIABLE_VALUE!dnn_base_20-units/dense_18/kernel(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEdnn_base_20-units/dense_18/bias&dense4/bias/.ATTRIBUTES/VARIABLE_VALUE

0
 1

0
 1
 
?
Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
!	variables
"trainable_variables
#regularization_losses
_]
VARIABLE_VALUE!dnn_base_20-units/dense_19/kernel(dense5/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEdnn_base_20-units/dense_19/bias&dense5/bias/.ATTRIBUTES/VARIABLE_VALUE

%0
&1

%0
&1
 
?
Onon_trainable_variables

Players
Qmetrics
Rlayer_regularization_losses
Slayer_metrics
'	variables
(trainable_variables
)regularization_losses
ec
VARIABLE_VALUE!dnn_base_20-units/dense_20/kernel.output_layer/kernel/.ATTRIBUTES/VARIABLE_VALUE
a_
VARIABLE_VALUEdnn_base_20-units/dense_20/bias,output_layer/bias/.ATTRIBUTES/VARIABLE_VALUE

+0
,1

+0
,1
 
?
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
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_15/kernel/mDdense1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_15/bias/mBdense1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_16/kernel/mDdense2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_16/bias/mBdense2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_17/kernel/mDdense3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_17/bias/mBdense3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_18/kernel/mDdense4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_18/bias/mBdense4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_19/kernel/mDdense5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_19/bias/mBdense5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_20/kernel/mJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_20/bias/mHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_15/kernel/vDdense1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_15/bias/vBdense1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_16/kernel/vDdense2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_16/bias/vBdense2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_17/kernel/vDdense3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_17/bias/vBdense3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_18/kernel/vDdense4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_18/bias/vBdense4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_19/kernel/vDdense5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_19/bias/vBdense5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE(Adam/dnn_base_20-units/dense_20/kernel/vJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE&Adam/dnn_base_20-units/dense_20/bias/vHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|
serving_default_input_1Placeholder*(
_output_shapes
:??????????*
dtype0*
shape:??????????
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1!dnn_base_20-units/dense_15/kerneldnn_base_20-units/dense_15/bias!dnn_base_20-units/dense_16/kerneldnn_base_20-units/dense_16/bias!dnn_base_20-units/dense_17/kerneldnn_base_20-units/dense_17/bias!dnn_base_20-units/dense_18/kerneldnn_base_20-units/dense_18/bias!dnn_base_20-units/dense_19/kerneldnn_base_20-units/dense_19/bias!dnn_base_20-units/dense_20/kerneldnn_base_20-units/dense_20/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8? *,
f'R%
#__inference_signature_wrapper_53969
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename5dnn_base_20-units/dense_15/kernel/Read/ReadVariableOp3dnn_base_20-units/dense_15/bias/Read/ReadVariableOp5dnn_base_20-units/dense_16/kernel/Read/ReadVariableOp3dnn_base_20-units/dense_16/bias/Read/ReadVariableOp5dnn_base_20-units/dense_17/kernel/Read/ReadVariableOp3dnn_base_20-units/dense_17/bias/Read/ReadVariableOp5dnn_base_20-units/dense_18/kernel/Read/ReadVariableOp3dnn_base_20-units/dense_18/bias/Read/ReadVariableOp5dnn_base_20-units/dense_19/kernel/Read/ReadVariableOp3dnn_base_20-units/dense_19/bias/Read/ReadVariableOp5dnn_base_20-units/dense_20/kernel/Read/ReadVariableOp3dnn_base_20-units/dense_20/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_15/kernel/m/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_15/bias/m/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_16/kernel/m/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_16/bias/m/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_17/kernel/m/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_17/bias/m/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_18/kernel/m/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_18/bias/m/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_19/kernel/m/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_19/bias/m/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_20/kernel/m/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_20/bias/m/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_15/kernel/v/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_15/bias/v/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_16/kernel/v/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_16/bias/v/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_17/kernel/v/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_17/bias/v/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_18/kernel/v/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_18/bias/v/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_19/kernel/v/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_19/bias/v/Read/ReadVariableOp<Adam/dnn_base_20-units/dense_20/kernel/v/Read/ReadVariableOp:Adam/dnn_base_20-units/dense_20/bias/v/Read/ReadVariableOpConst*:
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
GPU2*0,1J 8? *'
f"R 
__inference__traced_save_54322
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filename!dnn_base_20-units/dense_15/kerneldnn_base_20-units/dense_15/bias!dnn_base_20-units/dense_16/kerneldnn_base_20-units/dense_16/bias!dnn_base_20-units/dense_17/kerneldnn_base_20-units/dense_17/bias!dnn_base_20-units/dense_18/kerneldnn_base_20-units/dense_18/bias!dnn_base_20-units/dense_19/kerneldnn_base_20-units/dense_19/bias!dnn_base_20-units/dense_20/kerneldnn_base_20-units/dense_20/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1(Adam/dnn_base_20-units/dense_15/kernel/m&Adam/dnn_base_20-units/dense_15/bias/m(Adam/dnn_base_20-units/dense_16/kernel/m&Adam/dnn_base_20-units/dense_16/bias/m(Adam/dnn_base_20-units/dense_17/kernel/m&Adam/dnn_base_20-units/dense_17/bias/m(Adam/dnn_base_20-units/dense_18/kernel/m&Adam/dnn_base_20-units/dense_18/bias/m(Adam/dnn_base_20-units/dense_19/kernel/m&Adam/dnn_base_20-units/dense_19/bias/m(Adam/dnn_base_20-units/dense_20/kernel/m&Adam/dnn_base_20-units/dense_20/bias/m(Adam/dnn_base_20-units/dense_15/kernel/v&Adam/dnn_base_20-units/dense_15/bias/v(Adam/dnn_base_20-units/dense_16/kernel/v&Adam/dnn_base_20-units/dense_16/bias/v(Adam/dnn_base_20-units/dense_17/kernel/v&Adam/dnn_base_20-units/dense_17/bias/v(Adam/dnn_base_20-units/dense_18/kernel/v&Adam/dnn_base_20-units/dense_18/bias/v(Adam/dnn_base_20-units/dense_19/kernel/v&Adam/dnn_base_20-units/dense_19/bias/v(Adam/dnn_base_20-units/dense_20/kernel/v&Adam/dnn_base_20-units/dense_20/bias/v*9
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
GPU2*0,1J 8? **
f%R#
!__inference__traced_restore_54467??
?G
?
 __inference__wrapped_model_53672
input_1L
9dnn_base_20_units_dense_15_matmul_readvariableop_resource:	?H
:dnn_base_20_units_dense_15_biasadd_readvariableop_resource:K
9dnn_base_20_units_dense_16_matmul_readvariableop_resource:H
:dnn_base_20_units_dense_16_biasadd_readvariableop_resource:K
9dnn_base_20_units_dense_17_matmul_readvariableop_resource:H
:dnn_base_20_units_dense_17_biasadd_readvariableop_resource:K
9dnn_base_20_units_dense_18_matmul_readvariableop_resource:H
:dnn_base_20_units_dense_18_biasadd_readvariableop_resource:K
9dnn_base_20_units_dense_19_matmul_readvariableop_resource:H
:dnn_base_20_units_dense_19_biasadd_readvariableop_resource:K
9dnn_base_20_units_dense_20_matmul_readvariableop_resource:H
:dnn_base_20_units_dense_20_biasadd_readvariableop_resource:
identity??1dnn_base_20-units/dense_15/BiasAdd/ReadVariableOp?0dnn_base_20-units/dense_15/MatMul/ReadVariableOp?1dnn_base_20-units/dense_16/BiasAdd/ReadVariableOp?0dnn_base_20-units/dense_16/MatMul/ReadVariableOp?1dnn_base_20-units/dense_17/BiasAdd/ReadVariableOp?0dnn_base_20-units/dense_17/MatMul/ReadVariableOp?1dnn_base_20-units/dense_18/BiasAdd/ReadVariableOp?0dnn_base_20-units/dense_18/MatMul/ReadVariableOp?1dnn_base_20-units/dense_19/BiasAdd/ReadVariableOp?0dnn_base_20-units/dense_19/MatMul/ReadVariableOp?1dnn_base_20-units/dense_20/BiasAdd/ReadVariableOp?0dnn_base_20-units/dense_20/MatMul/ReadVariableOp?
0dnn_base_20-units/dense_15/MatMul/ReadVariableOpReadVariableOp9dnn_base_20_units_dense_15_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
!dnn_base_20-units/dense_15/MatMulMatMulinput_18dnn_base_20-units/dense_15/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
1dnn_base_20-units/dense_15/BiasAdd/ReadVariableOpReadVariableOp:dnn_base_20_units_dense_15_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"dnn_base_20-units/dense_15/BiasAddBiasAdd+dnn_base_20-units/dense_15/MatMul:product:09dnn_base_20-units/dense_15/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dnn_base_20-units/dense_15/ReluRelu+dnn_base_20-units/dense_15/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
0dnn_base_20-units/dense_16/MatMul/ReadVariableOpReadVariableOp9dnn_base_20_units_dense_16_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
!dnn_base_20-units/dense_16/MatMulMatMul-dnn_base_20-units/dense_15/Relu:activations:08dnn_base_20-units/dense_16/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
1dnn_base_20-units/dense_16/BiasAdd/ReadVariableOpReadVariableOp:dnn_base_20_units_dense_16_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"dnn_base_20-units/dense_16/BiasAddBiasAdd+dnn_base_20-units/dense_16/MatMul:product:09dnn_base_20-units/dense_16/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dnn_base_20-units/dense_16/ReluRelu+dnn_base_20-units/dense_16/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
0dnn_base_20-units/dense_17/MatMul/ReadVariableOpReadVariableOp9dnn_base_20_units_dense_17_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
!dnn_base_20-units/dense_17/MatMulMatMul-dnn_base_20-units/dense_16/Relu:activations:08dnn_base_20-units/dense_17/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
1dnn_base_20-units/dense_17/BiasAdd/ReadVariableOpReadVariableOp:dnn_base_20_units_dense_17_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"dnn_base_20-units/dense_17/BiasAddBiasAdd+dnn_base_20-units/dense_17/MatMul:product:09dnn_base_20-units/dense_17/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dnn_base_20-units/dense_17/ReluRelu+dnn_base_20-units/dense_17/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
0dnn_base_20-units/dense_18/MatMul/ReadVariableOpReadVariableOp9dnn_base_20_units_dense_18_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
!dnn_base_20-units/dense_18/MatMulMatMul-dnn_base_20-units/dense_17/Relu:activations:08dnn_base_20-units/dense_18/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
1dnn_base_20-units/dense_18/BiasAdd/ReadVariableOpReadVariableOp:dnn_base_20_units_dense_18_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"dnn_base_20-units/dense_18/BiasAddBiasAdd+dnn_base_20-units/dense_18/MatMul:product:09dnn_base_20-units/dense_18/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dnn_base_20-units/dense_18/ReluRelu+dnn_base_20-units/dense_18/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
0dnn_base_20-units/dense_19/MatMul/ReadVariableOpReadVariableOp9dnn_base_20_units_dense_19_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
!dnn_base_20-units/dense_19/MatMulMatMul-dnn_base_20-units/dense_18/Relu:activations:08dnn_base_20-units/dense_19/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
1dnn_base_20-units/dense_19/BiasAdd/ReadVariableOpReadVariableOp:dnn_base_20_units_dense_19_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"dnn_base_20-units/dense_19/BiasAddBiasAdd+dnn_base_20-units/dense_19/MatMul:product:09dnn_base_20-units/dense_19/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dnn_base_20-units/dense_19/ReluRelu+dnn_base_20-units/dense_19/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
0dnn_base_20-units/dense_20/MatMul/ReadVariableOpReadVariableOp9dnn_base_20_units_dense_20_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
!dnn_base_20-units/dense_20/MatMulMatMul-dnn_base_20-units/dense_19/Relu:activations:08dnn_base_20-units/dense_20/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
1dnn_base_20-units/dense_20/BiasAdd/ReadVariableOpReadVariableOp:dnn_base_20_units_dense_20_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"dnn_base_20-units/dense_20/BiasAddBiasAdd+dnn_base_20-units/dense_20/MatMul:product:09dnn_base_20-units/dense_20/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
"dnn_base_20-units/dense_20/SigmoidSigmoid+dnn_base_20-units/dense_20/BiasAdd:output:0*
T0*'
_output_shapes
:?????????u
IdentityIdentity&dnn_base_20-units/dense_20/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp2^dnn_base_20-units/dense_15/BiasAdd/ReadVariableOp1^dnn_base_20-units/dense_15/MatMul/ReadVariableOp2^dnn_base_20-units/dense_16/BiasAdd/ReadVariableOp1^dnn_base_20-units/dense_16/MatMul/ReadVariableOp2^dnn_base_20-units/dense_17/BiasAdd/ReadVariableOp1^dnn_base_20-units/dense_17/MatMul/ReadVariableOp2^dnn_base_20-units/dense_18/BiasAdd/ReadVariableOp1^dnn_base_20-units/dense_18/MatMul/ReadVariableOp2^dnn_base_20-units/dense_19/BiasAdd/ReadVariableOp1^dnn_base_20-units/dense_19/MatMul/ReadVariableOp2^dnn_base_20-units/dense_20/BiasAdd/ReadVariableOp1^dnn_base_20-units/dense_20/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:??????????: : : : : : : : : : : : 2f
1dnn_base_20-units/dense_15/BiasAdd/ReadVariableOp1dnn_base_20-units/dense_15/BiasAdd/ReadVariableOp2d
0dnn_base_20-units/dense_15/MatMul/ReadVariableOp0dnn_base_20-units/dense_15/MatMul/ReadVariableOp2f
1dnn_base_20-units/dense_16/BiasAdd/ReadVariableOp1dnn_base_20-units/dense_16/BiasAdd/ReadVariableOp2d
0dnn_base_20-units/dense_16/MatMul/ReadVariableOp0dnn_base_20-units/dense_16/MatMul/ReadVariableOp2f
1dnn_base_20-units/dense_17/BiasAdd/ReadVariableOp1dnn_base_20-units/dense_17/BiasAdd/ReadVariableOp2d
0dnn_base_20-units/dense_17/MatMul/ReadVariableOp0dnn_base_20-units/dense_17/MatMul/ReadVariableOp2f
1dnn_base_20-units/dense_18/BiasAdd/ReadVariableOp1dnn_base_20-units/dense_18/BiasAdd/ReadVariableOp2d
0dnn_base_20-units/dense_18/MatMul/ReadVariableOp0dnn_base_20-units/dense_18/MatMul/ReadVariableOp2f
1dnn_base_20-units/dense_19/BiasAdd/ReadVariableOp1dnn_base_20-units/dense_19/BiasAdd/ReadVariableOp2d
0dnn_base_20-units/dense_19/MatMul/ReadVariableOp0dnn_base_20-units/dense_19/MatMul/ReadVariableOp2f
1dnn_base_20-units/dense_20/BiasAdd/ReadVariableOp1dnn_base_20-units/dense_20/BiasAdd/ReadVariableOp2d
0dnn_base_20-units/dense_20/MatMul/ReadVariableOp0dnn_base_20-units/dense_20/MatMul/ReadVariableOp:Q M
(
_output_shapes
:??????????
!
_user_specified_name	input_1
?

?
C__inference_dense_19_layer_call_and_return_conditional_losses_53758

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
(__inference_dense_16_layer_call_fn_54073

inputs
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_53707o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

?
C__inference_dense_17_layer_call_and_return_conditional_losses_54104

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?5
?	
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_54044

inputs:
'dense_15_matmul_readvariableop_resource:	?6
(dense_15_biasadd_readvariableop_resource:9
'dense_16_matmul_readvariableop_resource:6
(dense_16_biasadd_readvariableop_resource:9
'dense_17_matmul_readvariableop_resource:6
(dense_17_biasadd_readvariableop_resource:9
'dense_18_matmul_readvariableop_resource:6
(dense_18_biasadd_readvariableop_resource:9
'dense_19_matmul_readvariableop_resource:6
(dense_19_biasadd_readvariableop_resource:9
'dense_20_matmul_readvariableop_resource:6
(dense_20_biasadd_readvariableop_resource:
identity??dense_15/BiasAdd/ReadVariableOp?dense_15/MatMul/ReadVariableOp?dense_16/BiasAdd/ReadVariableOp?dense_16/MatMul/ReadVariableOp?dense_17/BiasAdd/ReadVariableOp?dense_17/MatMul/ReadVariableOp?dense_18/BiasAdd/ReadVariableOp?dense_18/MatMul/ReadVariableOp?dense_19/BiasAdd/ReadVariableOp?dense_19/MatMul/ReadVariableOp?dense_20/BiasAdd/ReadVariableOp?dense_20/MatMul/ReadVariableOp?
dense_15/MatMul/ReadVariableOpReadVariableOp'dense_15_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0{
dense_15/MatMulMatMulinputs&dense_15/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_15/BiasAdd/ReadVariableOpReadVariableOp(dense_15_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_15/BiasAddBiasAdddense_15/MatMul:product:0'dense_15/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????b
dense_15/ReluReludense_15/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
dense_16/MatMul/ReadVariableOpReadVariableOp'dense_16_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
dense_16/MatMulMatMuldense_15/Relu:activations:0&dense_16/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_16/BiasAdd/ReadVariableOpReadVariableOp(dense_16_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_16/BiasAddBiasAdddense_16/MatMul:product:0'dense_16/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????b
dense_16/ReluReludense_16/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
dense_17/MatMul/ReadVariableOpReadVariableOp'dense_17_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
dense_17/MatMulMatMuldense_16/Relu:activations:0&dense_17/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_17/BiasAdd/ReadVariableOpReadVariableOp(dense_17_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_17/BiasAddBiasAdddense_17/MatMul:product:0'dense_17/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????b
dense_17/ReluReludense_17/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
dense_18/MatMul/ReadVariableOpReadVariableOp'dense_18_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
dense_18/MatMulMatMuldense_17/Relu:activations:0&dense_18/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_18/BiasAdd/ReadVariableOpReadVariableOp(dense_18_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_18/BiasAddBiasAdddense_18/MatMul:product:0'dense_18/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????b
dense_18/ReluReludense_18/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
dense_19/MatMul/ReadVariableOpReadVariableOp'dense_19_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
dense_19/MatMulMatMuldense_18/Relu:activations:0&dense_19/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_19/BiasAdd/ReadVariableOpReadVariableOp(dense_19_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_19/BiasAddBiasAdddense_19/MatMul:product:0'dense_19/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????b
dense_19/ReluReludense_19/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
dense_20/MatMul/ReadVariableOpReadVariableOp'dense_20_matmul_readvariableop_resource*
_output_shapes

:*
dtype0?
dense_20/MatMulMatMuldense_19/Relu:activations:0&dense_20/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_20/BiasAdd/ReadVariableOpReadVariableOp(dense_20_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_20/BiasAddBiasAdddense_20/MatMul:product:0'dense_20/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????h
dense_20/SigmoidSigmoiddense_20/BiasAdd:output:0*
T0*'
_output_shapes
:?????????c
IdentityIdentitydense_20/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp ^dense_15/BiasAdd/ReadVariableOp^dense_15/MatMul/ReadVariableOp ^dense_16/BiasAdd/ReadVariableOp^dense_16/MatMul/ReadVariableOp ^dense_17/BiasAdd/ReadVariableOp^dense_17/MatMul/ReadVariableOp ^dense_18/BiasAdd/ReadVariableOp^dense_18/MatMul/ReadVariableOp ^dense_19/BiasAdd/ReadVariableOp^dense_19/MatMul/ReadVariableOp ^dense_20/BiasAdd/ReadVariableOp^dense_20/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:??????????: : : : : : : : : : : : 2B
dense_15/BiasAdd/ReadVariableOpdense_15/BiasAdd/ReadVariableOp2@
dense_15/MatMul/ReadVariableOpdense_15/MatMul/ReadVariableOp2B
dense_16/BiasAdd/ReadVariableOpdense_16/BiasAdd/ReadVariableOp2@
dense_16/MatMul/ReadVariableOpdense_16/MatMul/ReadVariableOp2B
dense_17/BiasAdd/ReadVariableOpdense_17/BiasAdd/ReadVariableOp2@
dense_17/MatMul/ReadVariableOpdense_17/MatMul/ReadVariableOp2B
dense_18/BiasAdd/ReadVariableOpdense_18/BiasAdd/ReadVariableOp2@
dense_18/MatMul/ReadVariableOpdense_18/MatMul/ReadVariableOp2B
dense_19/BiasAdd/ReadVariableOpdense_19/BiasAdd/ReadVariableOp2@
dense_19/MatMul/ReadVariableOpdense_19/MatMul/ReadVariableOp2B
dense_20/BiasAdd/ReadVariableOpdense_20/BiasAdd/ReadVariableOp2@
dense_20/MatMul/ReadVariableOpdense_20/MatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?

?
C__inference_dense_18_layer_call_and_return_conditional_losses_53741

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
1__inference_dnn_base_20-units_layer_call_fn_53809
input_1
unknown:	?
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8? *U
fPRN
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_53782o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:??????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:??????????
!
_user_specified_name	input_1
?

?
C__inference_dense_16_layer_call_and_return_conditional_losses_54084

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
(__inference_dense_19_layer_call_fn_54133

inputs
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_19_layer_call_and_return_conditional_losses_53758o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

?
C__inference_dense_16_layer_call_and_return_conditional_losses_53707

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
(__inference_dense_17_layer_call_fn_54093

inputs
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_53724o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
? 
?
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_53782

inputs!
dense_15_53691:	?
dense_15_53693: 
dense_16_53708:
dense_16_53710: 
dense_17_53725:
dense_17_53727: 
dense_18_53742:
dense_18_53744: 
dense_19_53759:
dense_19_53761: 
dense_20_53776:
dense_20_53778:
identity?? dense_15/StatefulPartitionedCall? dense_16/StatefulPartitionedCall? dense_17/StatefulPartitionedCall? dense_18/StatefulPartitionedCall? dense_19/StatefulPartitionedCall? dense_20/StatefulPartitionedCall?
 dense_15/StatefulPartitionedCallStatefulPartitionedCallinputsdense_15_53691dense_15_53693*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_15_layer_call_and_return_conditional_losses_53690?
 dense_16/StatefulPartitionedCallStatefulPartitionedCall)dense_15/StatefulPartitionedCall:output:0dense_16_53708dense_16_53710*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_53707?
 dense_17/StatefulPartitionedCallStatefulPartitionedCall)dense_16/StatefulPartitionedCall:output:0dense_17_53725dense_17_53727*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_53724?
 dense_18/StatefulPartitionedCallStatefulPartitionedCall)dense_17/StatefulPartitionedCall:output:0dense_18_53742dense_18_53744*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_18_layer_call_and_return_conditional_losses_53741?
 dense_19/StatefulPartitionedCallStatefulPartitionedCall)dense_18/StatefulPartitionedCall:output:0dense_19_53759dense_19_53761*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_19_layer_call_and_return_conditional_losses_53758?
 dense_20/StatefulPartitionedCallStatefulPartitionedCall)dense_19/StatefulPartitionedCall:output:0dense_20_53776dense_20_53778*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_20_layer_call_and_return_conditional_losses_53775x
IdentityIdentity)dense_20/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp!^dense_15/StatefulPartitionedCall!^dense_16/StatefulPartitionedCall!^dense_17/StatefulPartitionedCall!^dense_18/StatefulPartitionedCall!^dense_19/StatefulPartitionedCall!^dense_20/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:??????????: : : : : : : : : : : : 2D
 dense_15/StatefulPartitionedCall dense_15/StatefulPartitionedCall2D
 dense_16/StatefulPartitionedCall dense_16/StatefulPartitionedCall2D
 dense_17/StatefulPartitionedCall dense_17/StatefulPartitionedCall2D
 dense_18/StatefulPartitionedCall dense_18/StatefulPartitionedCall2D
 dense_19/StatefulPartitionedCall dense_19/StatefulPartitionedCall2D
 dense_20/StatefulPartitionedCall dense_20/StatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?

?
C__inference_dense_17_layer_call_and_return_conditional_losses_53724

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
(__inference_dense_20_layer_call_fn_54153

inputs
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_20_layer_call_and_return_conditional_losses_53775o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

?
C__inference_dense_15_layer_call_and_return_conditional_losses_53690

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?

?
C__inference_dense_18_layer_call_and_return_conditional_losses_54124

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

?
C__inference_dense_20_layer_call_and_return_conditional_losses_54164

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:?????????Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
? 
?
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_53932
input_1!
dense_15_53901:	?
dense_15_53903: 
dense_16_53906:
dense_16_53908: 
dense_17_53911:
dense_17_53913: 
dense_18_53916:
dense_18_53918: 
dense_19_53921:
dense_19_53923: 
dense_20_53926:
dense_20_53928:
identity?? dense_15/StatefulPartitionedCall? dense_16/StatefulPartitionedCall? dense_17/StatefulPartitionedCall? dense_18/StatefulPartitionedCall? dense_19/StatefulPartitionedCall? dense_20/StatefulPartitionedCall?
 dense_15/StatefulPartitionedCallStatefulPartitionedCallinput_1dense_15_53901dense_15_53903*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_15_layer_call_and_return_conditional_losses_53690?
 dense_16/StatefulPartitionedCallStatefulPartitionedCall)dense_15/StatefulPartitionedCall:output:0dense_16_53906dense_16_53908*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_16_layer_call_and_return_conditional_losses_53707?
 dense_17/StatefulPartitionedCallStatefulPartitionedCall)dense_16/StatefulPartitionedCall:output:0dense_17_53911dense_17_53913*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_17_layer_call_and_return_conditional_losses_53724?
 dense_18/StatefulPartitionedCallStatefulPartitionedCall)dense_17/StatefulPartitionedCall:output:0dense_18_53916dense_18_53918*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_18_layer_call_and_return_conditional_losses_53741?
 dense_19/StatefulPartitionedCallStatefulPartitionedCall)dense_18/StatefulPartitionedCall:output:0dense_19_53921dense_19_53923*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_19_layer_call_and_return_conditional_losses_53758?
 dense_20/StatefulPartitionedCallStatefulPartitionedCall)dense_19/StatefulPartitionedCall:output:0dense_20_53926dense_20_53928*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_20_layer_call_and_return_conditional_losses_53775x
IdentityIdentity)dense_20/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp!^dense_15/StatefulPartitionedCall!^dense_16/StatefulPartitionedCall!^dense_17/StatefulPartitionedCall!^dense_18/StatefulPartitionedCall!^dense_19/StatefulPartitionedCall!^dense_20/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:??????????: : : : : : : : : : : : 2D
 dense_15/StatefulPartitionedCall dense_15/StatefulPartitionedCall2D
 dense_16/StatefulPartitionedCall dense_16/StatefulPartitionedCall2D
 dense_17/StatefulPartitionedCall dense_17/StatefulPartitionedCall2D
 dense_18/StatefulPartitionedCall dense_18/StatefulPartitionedCall2D
 dense_19/StatefulPartitionedCall dense_19/StatefulPartitionedCall2D
 dense_20/StatefulPartitionedCall dense_20/StatefulPartitionedCall:Q M
(
_output_shapes
:??????????
!
_user_specified_name	input_1
ù
? 
!__inference__traced_restore_54467
file_prefixE
2assignvariableop_dnn_base_20_units_dense_15_kernel:	?@
2assignvariableop_1_dnn_base_20_units_dense_15_bias:F
4assignvariableop_2_dnn_base_20_units_dense_16_kernel:@
2assignvariableop_3_dnn_base_20_units_dense_16_bias:F
4assignvariableop_4_dnn_base_20_units_dense_17_kernel:@
2assignvariableop_5_dnn_base_20_units_dense_17_bias:F
4assignvariableop_6_dnn_base_20_units_dense_18_kernel:@
2assignvariableop_7_dnn_base_20_units_dense_18_bias:F
4assignvariableop_8_dnn_base_20_units_dense_19_kernel:@
2assignvariableop_9_dnn_base_20_units_dense_19_bias:G
5assignvariableop_10_dnn_base_20_units_dense_20_kernel:A
3assignvariableop_11_dnn_base_20_units_dense_20_bias:'
assignvariableop_12_adam_iter:	 )
assignvariableop_13_adam_beta_1: )
assignvariableop_14_adam_beta_2: (
assignvariableop_15_adam_decay: 0
&assignvariableop_16_adam_learning_rate: #
assignvariableop_17_total: #
assignvariableop_18_count: %
assignvariableop_19_total_1: %
assignvariableop_20_count_1: O
<assignvariableop_21_adam_dnn_base_20_units_dense_15_kernel_m:	?H
:assignvariableop_22_adam_dnn_base_20_units_dense_15_bias_m:N
<assignvariableop_23_adam_dnn_base_20_units_dense_16_kernel_m:H
:assignvariableop_24_adam_dnn_base_20_units_dense_16_bias_m:N
<assignvariableop_25_adam_dnn_base_20_units_dense_17_kernel_m:H
:assignvariableop_26_adam_dnn_base_20_units_dense_17_bias_m:N
<assignvariableop_27_adam_dnn_base_20_units_dense_18_kernel_m:H
:assignvariableop_28_adam_dnn_base_20_units_dense_18_bias_m:N
<assignvariableop_29_adam_dnn_base_20_units_dense_19_kernel_m:H
:assignvariableop_30_adam_dnn_base_20_units_dense_19_bias_m:N
<assignvariableop_31_adam_dnn_base_20_units_dense_20_kernel_m:H
:assignvariableop_32_adam_dnn_base_20_units_dense_20_bias_m:O
<assignvariableop_33_adam_dnn_base_20_units_dense_15_kernel_v:	?H
:assignvariableop_34_adam_dnn_base_20_units_dense_15_bias_v:N
<assignvariableop_35_adam_dnn_base_20_units_dense_16_kernel_v:H
:assignvariableop_36_adam_dnn_base_20_units_dense_16_bias_v:N
<assignvariableop_37_adam_dnn_base_20_units_dense_17_kernel_v:H
:assignvariableop_38_adam_dnn_base_20_units_dense_17_bias_v:N
<assignvariableop_39_adam_dnn_base_20_units_dense_18_kernel_v:H
:assignvariableop_40_adam_dnn_base_20_units_dense_18_bias_v:N
<assignvariableop_41_adam_dnn_base_20_units_dense_19_kernel_v:H
:assignvariableop_42_adam_dnn_base_20_units_dense_19_bias_v:N
<assignvariableop_43_adam_dnn_base_20_units_dense_20_kernel_v:H
:assignvariableop_44_adam_dnn_base_20_units_dense_20_bias_v:
identity_46??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_24?AssignVariableOp_25?AssignVariableOp_26?AssignVariableOp_27?AssignVariableOp_28?AssignVariableOp_29?AssignVariableOp_3?AssignVariableOp_30?AssignVariableOp_31?AssignVariableOp_32?AssignVariableOp_33?AssignVariableOp_34?AssignVariableOp_35?AssignVariableOp_36?AssignVariableOp_37?AssignVariableOp_38?AssignVariableOp_39?AssignVariableOp_4?AssignVariableOp_40?AssignVariableOp_41?AssignVariableOp_42?AssignVariableOp_43?AssignVariableOp_44?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*?
value?B?.B(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense4/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense5/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense5/bias/.ATTRIBUTES/VARIABLE_VALUEB.output_layer/kernel/.ATTRIBUTES/VARIABLE_VALUEB,output_layer/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*?
_output_shapes?
?::::::::::::::::::::::::::::::::::::::::::::::*<
dtypes2
02.	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOpAssignVariableOp2assignvariableop_dnn_base_20_units_dense_15_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_1AssignVariableOp2assignvariableop_1_dnn_base_20_units_dense_15_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_2AssignVariableOp4assignvariableop_2_dnn_base_20_units_dense_16_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_3AssignVariableOp2assignvariableop_3_dnn_base_20_units_dense_16_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_4AssignVariableOp4assignvariableop_4_dnn_base_20_units_dense_17_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_5AssignVariableOp2assignvariableop_5_dnn_base_20_units_dense_17_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_6AssignVariableOp4assignvariableop_6_dnn_base_20_units_dense_18_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_7AssignVariableOp2assignvariableop_7_dnn_base_20_units_dense_18_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_8AssignVariableOp4assignvariableop_8_dnn_base_20_units_dense_19_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_9AssignVariableOp2assignvariableop_9_dnn_base_20_units_dense_19_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_10AssignVariableOp5assignvariableop_10_dnn_base_20_units_dense_20_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_11AssignVariableOp3assignvariableop_11_dnn_base_20_units_dense_20_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0	*
_output_shapes
:?
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_iterIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_13AssignVariableOpassignvariableop_13_adam_beta_1Identity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_14AssignVariableOpassignvariableop_14_adam_beta_2Identity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_15AssignVariableOpassignvariableop_15_adam_decayIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_16AssignVariableOp&assignvariableop_16_adam_learning_rateIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_17AssignVariableOpassignvariableop_17_totalIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_18AssignVariableOpassignvariableop_18_countIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_19AssignVariableOpassignvariableop_19_total_1Identity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_20AssignVariableOpassignvariableop_20_count_1Identity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_21AssignVariableOp<assignvariableop_21_adam_dnn_base_20_units_dense_15_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_22AssignVariableOp:assignvariableop_22_adam_dnn_base_20_units_dense_15_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_23AssignVariableOp<assignvariableop_23_adam_dnn_base_20_units_dense_16_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_24AssignVariableOp:assignvariableop_24_adam_dnn_base_20_units_dense_16_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_25AssignVariableOp<assignvariableop_25_adam_dnn_base_20_units_dense_17_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_26AssignVariableOp:assignvariableop_26_adam_dnn_base_20_units_dense_17_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_27AssignVariableOp<assignvariableop_27_adam_dnn_base_20_units_dense_18_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_28AssignVariableOp:assignvariableop_28_adam_dnn_base_20_units_dense_18_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_29AssignVariableOp<assignvariableop_29_adam_dnn_base_20_units_dense_19_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_30AssignVariableOp:assignvariableop_30_adam_dnn_base_20_units_dense_19_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_31AssignVariableOp<assignvariableop_31_adam_dnn_base_20_units_dense_20_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_32AssignVariableOp:assignvariableop_32_adam_dnn_base_20_units_dense_20_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_33AssignVariableOp<assignvariableop_33_adam_dnn_base_20_units_dense_15_kernel_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_34AssignVariableOp:assignvariableop_34_adam_dnn_base_20_units_dense_15_bias_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_35AssignVariableOp<assignvariableop_35_adam_dnn_base_20_units_dense_16_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_36AssignVariableOp:assignvariableop_36_adam_dnn_base_20_units_dense_16_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_37AssignVariableOp<assignvariableop_37_adam_dnn_base_20_units_dense_17_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_38AssignVariableOp:assignvariableop_38_adam_dnn_base_20_units_dense_17_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_39AssignVariableOp<assignvariableop_39_adam_dnn_base_20_units_dense_18_kernel_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_40AssignVariableOp:assignvariableop_40_adam_dnn_base_20_units_dense_18_bias_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_41AssignVariableOp<assignvariableop_41_adam_dnn_base_20_units_dense_19_kernel_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_42AssignVariableOp:assignvariableop_42_adam_dnn_base_20_units_dense_19_bias_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_43AssignVariableOp<assignvariableop_43_adam_dnn_base_20_units_dense_20_kernel_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_44AssignVariableOp:assignvariableop_44_adam_dnn_base_20_units_dense_20_bias_vIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ?
Identity_45Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_46IdentityIdentity_45:output:0^NoOp_1*
T0*
_output_shapes
: ?
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
?
?
1__inference_dnn_base_20-units_layer_call_fn_53998

inputs
unknown:	?
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8? *U
fPRN
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_53782o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:??????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?

?
C__inference_dense_20_layer_call_and_return_conditional_losses_53775

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:?????????Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

?
#__inference_signature_wrapper_53969
input_1
unknown:	?
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8? *)
f$R"
 __inference__wrapped_model_53672o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:??????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:??????????
!
_user_specified_name	input_1
?
?
(__inference_dense_15_layer_call_fn_54053

inputs
unknown:	?
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_15_layer_call_and_return_conditional_losses_53690o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?

?
C__inference_dense_15_layer_call_and_return_conditional_losses_54064

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?

?
C__inference_dense_19_layer_call_and_return_conditional_losses_54144

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:?????????a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:?????????w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
(__inference_dense_18_layer_call_fn_54113

inputs
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8? *L
fGRE
C__inference_dense_18_layer_call_and_return_conditional_losses_53741o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?a
?
__inference__traced_save_54322
file_prefix@
<savev2_dnn_base_20_units_dense_15_kernel_read_readvariableop>
:savev2_dnn_base_20_units_dense_15_bias_read_readvariableop@
<savev2_dnn_base_20_units_dense_16_kernel_read_readvariableop>
:savev2_dnn_base_20_units_dense_16_bias_read_readvariableop@
<savev2_dnn_base_20_units_dense_17_kernel_read_readvariableop>
:savev2_dnn_base_20_units_dense_17_bias_read_readvariableop@
<savev2_dnn_base_20_units_dense_18_kernel_read_readvariableop>
:savev2_dnn_base_20_units_dense_18_bias_read_readvariableop@
<savev2_dnn_base_20_units_dense_19_kernel_read_readvariableop>
:savev2_dnn_base_20_units_dense_19_bias_read_readvariableop@
<savev2_dnn_base_20_units_dense_20_kernel_read_readvariableop>
:savev2_dnn_base_20_units_dense_20_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_15_kernel_m_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_15_bias_m_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_16_kernel_m_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_16_bias_m_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_17_kernel_m_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_17_bias_m_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_18_kernel_m_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_18_bias_m_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_19_kernel_m_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_19_bias_m_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_20_kernel_m_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_20_bias_m_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_15_kernel_v_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_15_bias_v_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_16_kernel_v_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_16_bias_v_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_17_kernel_v_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_17_bias_v_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_18_kernel_v_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_18_bias_v_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_19_kernel_v_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_19_bias_v_read_readvariableopG
Csavev2_adam_dnn_base_20_units_dense_20_kernel_v_read_readvariableopE
Asavev2_adam_dnn_base_20_units_dense_20_bias_v_read_readvariableop
savev2_const

identity_1??MergeV2Checkpointsw
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
_temp/part?
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
value	B : ?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*?
value?B?.B(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense4/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense5/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense5/bias/.ATTRIBUTES/VARIABLE_VALUEB.output_layer/kernel/.ATTRIBUTES/VARIABLE_VALUEB,output_layer/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBDdense1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBDdense5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBdense5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBJoutput_layer/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHoutput_layer/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0<savev2_dnn_base_20_units_dense_15_kernel_read_readvariableop:savev2_dnn_base_20_units_dense_15_bias_read_readvariableop<savev2_dnn_base_20_units_dense_16_kernel_read_readvariableop:savev2_dnn_base_20_units_dense_16_bias_read_readvariableop<savev2_dnn_base_20_units_dense_17_kernel_read_readvariableop:savev2_dnn_base_20_units_dense_17_bias_read_readvariableop<savev2_dnn_base_20_units_dense_18_kernel_read_readvariableop:savev2_dnn_base_20_units_dense_18_bias_read_readvariableop<savev2_dnn_base_20_units_dense_19_kernel_read_readvariableop:savev2_dnn_base_20_units_dense_19_bias_read_readvariableop<savev2_dnn_base_20_units_dense_20_kernel_read_readvariableop:savev2_dnn_base_20_units_dense_20_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_15_kernel_m_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_15_bias_m_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_16_kernel_m_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_16_bias_m_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_17_kernel_m_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_17_bias_m_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_18_kernel_m_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_18_bias_m_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_19_kernel_m_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_19_bias_m_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_20_kernel_m_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_20_bias_m_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_15_kernel_v_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_15_bias_v_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_16_kernel_v_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_16_bias_v_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_17_kernel_v_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_17_bias_v_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_18_kernel_v_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_18_bias_v_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_19_kernel_v_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_19_bias_v_read_readvariableopCsavev2_adam_dnn_base_20_units_dense_20_kernel_v_read_readvariableopAsavev2_adam_dnn_base_20_units_dense_20_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *<
dtypes2
02.	?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:?
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

identity_1Identity_1:output:0*?
_input_shapes?
?: :	?:::::::::::: : : : : : : : : :	?::::::::::::	?:::::::::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	?: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$	 

_output_shapes

:: 


_output_shapes
::$ 

_output_shapes

:: 
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
:	?: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$  

_output_shapes

:: !

_output_shapes
::%"!

_output_shapes
:	?: #

_output_shapes
::$$ 

_output_shapes

:: %

_output_shapes
::$& 

_output_shapes

:: '

_output_shapes
::$( 

_output_shapes

:: )

_output_shapes
::$* 

_output_shapes

:: +

_output_shapes
::$, 

_output_shapes

:: -

_output_shapes
::.

_output_shapes
: "?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
<
input_11
serving_default_input_1:0??????????<
output_10
StatefulPartitionedCall:0?????????tensorflow/serving/predict:?w
?

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
?

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?

kernel
 bias
!	variables
"trainable_variables
#regularization_losses
$	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?

%kernel
&bias
'	variables
(trainable_variables
)regularization_losses
*	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?

+kernel
,bias
-	variables
.trainable_variables
/regularization_losses
0	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
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
?
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
?serving_default"
signature_map
4:2	?2!dnn_base_20-units/dense_15/kernel
-:+2dnn_base_20-units/dense_15/bias
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
?
;non_trainable_variables

<layers
=metrics
>layer_regularization_losses
?layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
3:12!dnn_base_20-units/dense_16/kernel
-:+2dnn_base_20-units/dense_16/bias
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
?
@non_trainable_variables

Alayers
Bmetrics
Clayer_regularization_losses
Dlayer_metrics
	variables
trainable_variables
regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
3:12!dnn_base_20-units/dense_17/kernel
-:+2dnn_base_20-units/dense_17/bias
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
?
Enon_trainable_variables

Flayers
Gmetrics
Hlayer_regularization_losses
Ilayer_metrics
	variables
trainable_variables
regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
3:12!dnn_base_20-units/dense_18/kernel
-:+2dnn_base_20-units/dense_18/bias
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
?
Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
!	variables
"trainable_variables
#regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
3:12!dnn_base_20-units/dense_19/kernel
-:+2dnn_base_20-units/dense_19/bias
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
?
Onon_trainable_variables

Players
Qmetrics
Rlayer_regularization_losses
Slayer_metrics
'	variables
(trainable_variables
)regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
3:12!dnn_base_20-units/dense_20/kernel
-:+2dnn_base_20-units/dense_20/bias
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
?
Tnon_trainable_variables

Ulayers
Vmetrics
Wlayer_regularization_losses
Xlayer_metrics
-	variables
.trainable_variables
/regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
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
9:7	?2(Adam/dnn_base_20-units/dense_15/kernel/m
2:02&Adam/dnn_base_20-units/dense_15/bias/m
8:62(Adam/dnn_base_20-units/dense_16/kernel/m
2:02&Adam/dnn_base_20-units/dense_16/bias/m
8:62(Adam/dnn_base_20-units/dense_17/kernel/m
2:02&Adam/dnn_base_20-units/dense_17/bias/m
8:62(Adam/dnn_base_20-units/dense_18/kernel/m
2:02&Adam/dnn_base_20-units/dense_18/bias/m
8:62(Adam/dnn_base_20-units/dense_19/kernel/m
2:02&Adam/dnn_base_20-units/dense_19/bias/m
8:62(Adam/dnn_base_20-units/dense_20/kernel/m
2:02&Adam/dnn_base_20-units/dense_20/bias/m
9:7	?2(Adam/dnn_base_20-units/dense_15/kernel/v
2:02&Adam/dnn_base_20-units/dense_15/bias/v
8:62(Adam/dnn_base_20-units/dense_16/kernel/v
2:02&Adam/dnn_base_20-units/dense_16/bias/v
8:62(Adam/dnn_base_20-units/dense_17/kernel/v
2:02&Adam/dnn_base_20-units/dense_17/bias/v
8:62(Adam/dnn_base_20-units/dense_18/kernel/v
2:02&Adam/dnn_base_20-units/dense_18/bias/v
8:62(Adam/dnn_base_20-units/dense_19/kernel/v
2:02&Adam/dnn_base_20-units/dense_19/bias/v
8:62(Adam/dnn_base_20-units/dense_20/kernel/v
2:02&Adam/dnn_base_20-units/dense_20/bias/v
?2?
1__inference_dnn_base_20-units_layer_call_fn_53809
1__inference_dnn_base_20-units_layer_call_fn_53998?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_54044
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_53932?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
 __inference__wrapped_model_53672input_1"?
???
FullArgSpec
args? 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_15_layer_call_fn_54053?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_15_layer_call_and_return_conditional_losses_54064?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_16_layer_call_fn_54073?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_16_layer_call_and_return_conditional_losses_54084?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_17_layer_call_fn_54093?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_17_layer_call_and_return_conditional_losses_54104?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_18_layer_call_fn_54113?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_18_layer_call_and_return_conditional_losses_54124?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_19_layer_call_fn_54133?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_19_layer_call_and_return_conditional_losses_54144?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_20_layer_call_fn_54153?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_20_layer_call_and_return_conditional_losses_54164?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
#__inference_signature_wrapper_53969input_1"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ?
 __inference__wrapped_model_53672v %&+,1?.
'?$
"?
input_1??????????
? "3?0
.
output_1"?
output_1??????????
C__inference_dense_15_layer_call_and_return_conditional_losses_54064]0?-
&?#
!?
inputs??????????
? "%?"
?
0?????????
? |
(__inference_dense_15_layer_call_fn_54053P0?-
&?#
!?
inputs??????????
? "???????????
C__inference_dense_16_layer_call_and_return_conditional_losses_54084\/?,
%?"
 ?
inputs?????????
? "%?"
?
0?????????
? {
(__inference_dense_16_layer_call_fn_54073O/?,
%?"
 ?
inputs?????????
? "???????????
C__inference_dense_17_layer_call_and_return_conditional_losses_54104\/?,
%?"
 ?
inputs?????????
? "%?"
?
0?????????
? {
(__inference_dense_17_layer_call_fn_54093O/?,
%?"
 ?
inputs?????????
? "???????????
C__inference_dense_18_layer_call_and_return_conditional_losses_54124\ /?,
%?"
 ?
inputs?????????
? "%?"
?
0?????????
? {
(__inference_dense_18_layer_call_fn_54113O /?,
%?"
 ?
inputs?????????
? "???????????
C__inference_dense_19_layer_call_and_return_conditional_losses_54144\%&/?,
%?"
 ?
inputs?????????
? "%?"
?
0?????????
? {
(__inference_dense_19_layer_call_fn_54133O%&/?,
%?"
 ?
inputs?????????
? "???????????
C__inference_dense_20_layer_call_and_return_conditional_losses_54164\+,/?,
%?"
 ?
inputs?????????
? "%?"
?
0?????????
? {
(__inference_dense_20_layer_call_fn_54153O+,/?,
%?"
 ?
inputs?????????
? "???????????
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_53932h %&+,1?.
'?$
"?
input_1??????????
? "%?"
?
0?????????
? ?
L__inference_dnn_base_20-units_layer_call_and_return_conditional_losses_54044g %&+,0?-
&?#
!?
inputs??????????
? "%?"
?
0?????????
? ?
1__inference_dnn_base_20-units_layer_call_fn_53809[ %&+,1?.
'?$
"?
input_1??????????
? "???????????
1__inference_dnn_base_20-units_layer_call_fn_53998Z %&+,0?-
&?#
!?
inputs??????????
? "???????????
#__inference_signature_wrapper_53969? %&+,<?9
? 
2?/
-
input_1"?
input_1??????????"3?0
.
output_1"?
output_1?????????
# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#

#! @Chapter Neural Networks

#! @Section Operations

#! @Description
#!  Create a parametrised morphism representing the logits (pre-activation outputs) of a neural network.
#!  The network has an input layer of dimension <A>input_layer_dim</A>,
#!  hidden layers with dimensions given by <A>hidden_layers_dims</A>,
#!  and an output layer of dimension <A>output_layer_dim</A>.
#!  The hidden layers use ReLU activation; the output layer has no activation.
#! @Arguments Para, input_layer_dim, hidden_layers_dims, output_layer_dim
#! @Returns a parametrised morphism
DeclareOperation( "LogitsMorphismOfNeuralNetwork", [ IsCategoryOfParametrisedMorphisms, IsPosInt, IsDenseList, IsPosInt ] );

#! @Description
#!  Create a parametrised morphism representing the predictions of a neural network.
#!  Similar to <C>LogitsMorphismOfNeuralNetwork</C> but applies an <A>activation</A> function
#!  to the output layer. The <A>activation</A> should be one of: "Softmax", "Sigmoid", or "IdFunc".
#! @Arguments Para, input_layer_dim, hidden_layers_dims, output_layer_dim, activation
#! @Returns a parametrised morphism
DeclareOperation( "PredictionMorphismOfNeuralNetwork", [ IsCategoryOfParametrisedMorphisms, IsPosInt, IsDenseList, IsPosInt, IsString ] );

#! @Description
#!  Create a parametrised morphism representing the loss function of a neural network.
#!  The network has the architecture specified by <A>input_layer_dim</A>, <A>hidden_layers_dims</A>,
#!  and <A>output_layer_dim</A>. The <A>activation</A> determines both the final activation and
#!  the corresponding loss function:
#!  * "Softmax" uses cross-entropy loss
#!  * "Sigmoid" uses binary cross-entropy loss (requires output_layer_dim = 1)
#!  * "IdFunc" uses quadratic (mean squared error) loss
#! @Arguments Para, input_layer_dim, hidden_layers_dims, output_layer_dim, activation
#! @Returns a parametrised morphism
DeclareOperation( "LossMorphismOfNeuralNetwork", [ IsCategoryOfParametrisedMorphisms, IsPosInt, IsDenseList, IsPosInt, IsString ] );

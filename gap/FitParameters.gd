# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#

#! @Chapter Fitting Parameters

#! @Section Operations

#! @Description
#!  Create an update lens for one epoch of training.
#!  Takes a <A>parametrised_morphism</A> representing the loss function,
#!  an <A>optimizer</A> function (e.g., gradient descent or Adam),
#!  a list of <A>training_examples</A>, and a <A>batch_size</A>.
#!  Returns a lens that can be used to update the parameters for one epoch.
#! @Arguments parametrised_morphism, optimizer, training_examples, batch_size
#! @Returns a morphism in a category of lenses
DeclareOperation( "OneEpochUpdateLens", [ IsMorphismInCategoryOfParametrisedMorphisms, IsFunction, IsDenseList, IsPosInt ] );

#! @Description
#!  Perform <A>n</A> epochs of training using the given <A>epoch_lens</A> and initial weights <A>w</A>.
#!  Prints the loss at each epoch and returns the final weights.
#! @Arguments epoch_lens, n, w
#! @Returns a list of final weights
DeclareOperation( "Fit", [ IsMorphismInCategoryOfLenses, IsPosInt, IsDenseList ] );

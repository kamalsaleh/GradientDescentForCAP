# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#

#! @Chapter Category of Skeletal Smooth Maps

#! @Section GAP categories

#! @Description
#!  The &GAP; category of a category of skeletal smooth maps.
DeclareCategory( "IsCategoryOfSkeletalSmoothMaps",
        IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a category of skeletal smooth maps.
DeclareCategory( "IsObjectInCategoryOfSkeletalSmoothMaps",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a category of skeletal smooth maps.
DeclareCategory( "IsMorphismInCategoryOfSkeletalSmoothMaps",
        IsCapCategoryMorphism );

#! @Section Constructors

#! @Description
#!  Construct the category of skeletal smooth maps.
#!  Objects in this category are the Euclidean spaces $\mathbb{R}^n$ for non-negative integers $n$.
#!  Morphisms are smooth maps between these spaces, represented by a map function and its Jacobian matrix.
#! @Returns a category
DeclareGlobalFunction( "CategoryOfSkeletalSmoothMaps" );

#! @Description
#!  Construct a smooth morphism from <A>source</A> to <A>target</A> using the given <A>datum</A>.
#!  The <A>datum</A> should be a pair consisting of a map function and a Jacobian matrix function.
#! @Arguments Smooth, source, datum, target
#! @Returns a morphism in the category of skeletal smooth maps
DeclareOperation( "SmoothMorphism",
    [ IsCategoryOfSkeletalSmoothMaps, IsObjectInCategoryOfSkeletalSmoothMaps, IsDenseList, IsObjectInCategoryOfSkeletalSmoothMaps ] );

#! @Section Attributes

#! @Description
#!  The rank (dimension) of the Euclidean space represented by the object <A>obj</A>.
#!  For an object representing $\mathbb{R}^n$, this returns $n$.
#! @Arguments obj
#! @Returns a non-negative integer
DeclareAttribute( "RankOfObject", IsObjectInCategoryOfSkeletalSmoothMaps );

#! @Description
#!  The underlying map function of a smooth morphism <A>f</A>.
#!  For a morphism $f: \mathbb{R}^m \to \mathbb{R}^n$, this is a function that takes a list of $m$ elements
#!  and returns a list of $n$ elements.
#! @Arguments f
#! @Returns a function
DeclareAttribute( "Map", IsMorphismInCategoryOfSkeletalSmoothMaps );

#! @Description
#!  The Jacobian matrix function of a smooth morphism <A>f</A>.
#!  For a morphism $f: \mathbb{R}^m \to \mathbb{R}^n$, this is a function that takes a list of $m$ elements
#!  and returns an $n \times m$ matrix representing the partial derivatives.
#! @Arguments f
#! @Returns a function
DeclareAttribute( "JacobianMatrix", IsMorphismInCategoryOfSkeletalSmoothMaps );

#! @Section Operations

#! @Description
#!  Evaluate the smooth morphism <A>f</A> at the point <A>x</A>.
#! @Arguments f, x
#! @Returns a dense list
DeclareOperation( "Eval", [ IsMorphismInCategoryOfSkeletalSmoothMaps, IsDenseList ] );

#! @Description
#!  Evaluate the Jacobian matrix of the smooth morphism <A>f</A> at the point <A>x</A>.
#! @Arguments f, x
#! @Returns a matrix (list of lists)
DeclareOperation( "EvalJacobianMatrix", [ IsMorphismInCategoryOfSkeletalSmoothMaps, IsDenseList ] );

#! @Section Global variables

#! @Description
#!  A global variable containing settings for gradient descent operations.
#!  The field `MOD` can be set to "basic" or "train" to control behavior during training.
DeclareGlobalVariable( "GradientDescentForCAP" );

#! @Section Helper functions

#! @Description
#!  Generate dummy input strings for an affine transformation with <A>m</A> inputs and <A>n</A> outputs.
#!  Additional arguments specify the weight string, bias string, and optionally an input string.
#! @Arguments m, n, weight_str, bias_str[, input_str]
#! @Returns a list of strings
DeclareGlobalFunction( "DummyInputStringsForAffineTransformation" );

#! @Description
#!  Generate dummy input expressions for an affine transformation with <A>m</A> inputs and <A>n</A> outputs.
#!  Additional arguments specify the weight string, bias string, and optionally an input string.
#! @Arguments m, n, weight_str, bias_str[, input_str]
#! @Returns a list of expressions
DeclareGlobalFunction( "DummyInputForAffineTransformation" );

#! @Description
#!  Generate dummy input strings for a polynomial transformation with <A>m</A> inputs, <A>n</A> outputs,
#!  and specified <A>degree</A>.
#!  Additional arguments specify the weight string and optionally an input string.
#! @Arguments m, n, degree, weight_str[, input_str]
#! @Returns a list of strings
DeclareGlobalFunction( "DummyInputStringsForPolynomialTransformation" );

#! @Description
#!  Generate dummy input expressions for a polynomial transformation with <A>m</A> inputs, <A>n</A> outputs,
#!  and specified <A>degree</A>.
#!  Additional arguments specify the weight string and optionally an input string.
#! @Arguments m, n, degree, weight_str[, input_str]
#! @Returns a list of expressions
DeclareGlobalFunction( "DummyInputForPolynomialTransformation" );

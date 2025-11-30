# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#

#! @Chapter Category of Parametrised Morphisms

#! @Section GAP categories

#! @Description
#!  The &GAP; category of a category of parametrised morphisms.
DeclareCategory( "IsCategoryOfParametrisedMorphisms",
        IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a category of parametrised morphisms.
DeclareCategory( "IsObjectInCategoryOfParametrisedMorphisms",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a category of parametrised morphisms.
DeclareCategory( "IsMorphismInCategoryOfParametrisedMorphisms",
        IsCapCategoryMorphism );

#! @Section Constructors

#! @Description
#!  Construct the category of parametrised morphisms over the category <A>C</A>.
#!  A parametrised morphism $f_P: A \to B$ consists of a parameter object $P$ and an underlying morphism $P \otimes A \to B$.
#!  The category <A>C</A> must be a strict symmetric monoidal category.
#! @Arguments C
#! @Returns a category
DeclareOperation( "CategoryOfParametrisedMorphisms", [ IsCapCategory ] );

#! @Section Attributes

#! @Description
#!  Returns the underlying category of a category of parametrised morphisms.
#! @Arguments Para
#! @Returns a category
DeclareAttribute( "UnderlyingCategory", IsCategoryOfParametrisedMorphisms );

#! @Description
#!  Returns the underlying object for an object in the category of parametrised morphisms.
#! @Arguments A
#! @Returns an object in the underlying category
DeclareAttribute( "UnderlyingObject", IsObjectInCategoryOfParametrisedMorphisms );

#! @Description
#!  Returns the parameter object (underlying object) of a parametrised morphism.
#! @Arguments f
#! @Returns an object in the underlying category
DeclareAttribute( "UnderlyingObject", IsMorphismInCategoryOfParametrisedMorphisms );

#! @Description
#!  Returns the underlying morphism $P \otimes A \to B$ of a parametrised morphism $f_P: A \to B$.
#! @Arguments f
#! @Returns a morphism in the underlying category
DeclareAttribute( "UnderlyingMorphism", IsMorphismInCategoryOfParametrisedMorphisms );

#! @Section Operations

#! @Description
#!  Reparametrise the parametrised morphism <A>f</A> using the morphism <A>r</A>.
#!  If $f_P: A \to B$ and $r: Q \to P$, returns a morphism $f_Q: A \to B$.
#! @Arguments f, r
#! @Returns a parametrised morphism
DeclareOperation( "ReparametriseMorphism", [ IsMorphismInCategoryOfParametrisedMorphisms, IsCapCategoryMorphism ] );

#! @Description
#!  Switch the source object and the parameter object of a parametrised morphism.
#!  If $f_P: A \to B$, returns a morphism $g_A: P \to B$.
#! @Arguments f
#! @Returns a parametrised morphism
DeclareOperation( "SwitchSourceAndUnderlyingObject", [ IsMorphismInCategoryOfParametrisedMorphisms ] );

#! @Description
#!  Adjust the parametrised morphism <A>f</A> to work with a batch of <A>n</A> inputs.
#!  This is used for batch processing in neural network training.
#! @Arguments f, n
#! @Returns a parametrised morphism
DeclareOperation( "AdjustToBatchSize", [ IsMorphismInCategoryOfParametrisedMorphisms, IsInt ] );

#! @Description
#!  Natural embedding functor from category <A>C</A> into category of parametrised morphisms <A>Para</A>.
#! @Arguments C, Para
#! @Returns a functor
DeclareOperation( "NaturalEmbeddingIntoCategoryOfParametrisedMorphisms", [ IsCapCategory, IsCategoryOfParametrisedMorphisms ] );

#! @Description
#!  Embedding functor from category of parametrised morphisms <A>Para</A> into another category of parametrised morphisms <A>Para_Lenses</A>.
#! @Arguments Para, Para_Lenses
#! @Returns a functor
DeclareOperation( "EmbeddingIntoCategoryOfParametrisedMorphisms", [ IsCategoryOfParametrisedMorphisms, IsCategoryOfParametrisedMorphisms ] );


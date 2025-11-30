# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#

#! @Chapter Category of Lenses

#! @Section GAP categories

#! @Description
#!  The &GAP; category of a category of lenses.
DeclareCategory( "IsCategoryOfLenses",
        IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a category of lenses.
DeclareCategory( "IsObjectInCategoryOfLenses",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a category of lenses.
DeclareCategory( "IsMorphismInCategoryOfLenses",
        IsCapCategoryMorphism );

#! @Section Constructors

#! @Description
#!  Construct the category of lenses over the category <A>C</A>.
#!  A lens is a pair of morphisms: a "get" morphism and a "put" morphism,
#!  which together model bidirectional data flow used in automatic differentiation.
#! @Arguments C
#! @Returns a category
DeclareOperation( "CategoryOfLenses", [ IsCapCategory ] );

#! @Section Attributes

#! @Description
#!  Returns the underlying pair of objects $(S_1, S_2)$ for an object in the category of lenses.
#! @Arguments obj
#! @Returns a pair of objects
DeclareAttribute( "UnderlyingPairOfObjects", IsObjectInCategoryOfLenses );

#! @Description
#!  Returns the underlying pair of morphisms for a morphism in the category of lenses.
#! @Arguments f
#! @Returns a pair of morphisms
DeclareAttribute( "UnderlyingPairOfMorphisms", IsMorphismInCategoryOfLenses );

#! @Description
#!  Returns the "get" morphism of a lens.
#!  For a lens $f: (S_1, S_2) \to (T_1, T_2)$, this is the forward morphism $S_1 \to T_1$.
#! @Arguments f
#! @Returns a morphism
DeclareAttribute( "GetMorphism", IsMorphismInCategoryOfLenses );

#! @Description
#!  Returns the "put" morphism of a lens.
#!  For a lens $f: (S_1, S_2) \to (T_1, T_2)$, this is the backward morphism $S_1 \times T_2 \to S_2$.
#! @Arguments f
#! @Returns a morphism
DeclareAttribute( "PutMorphism", IsMorphismInCategoryOfLenses );

#! @Section Operations

#! @Description
#!  Embedding functor from the category <A>C</A> into the category of lenses <A>Lenses</A>.
#!  This embeds morphisms using their reverse differential.
#! @Arguments C, Lenses
#! @Returns a functor
DeclareOperation( "EmbeddingIntoCategoryOfLenses", [ IsCapCategory, IsCategoryOfLenses ] );

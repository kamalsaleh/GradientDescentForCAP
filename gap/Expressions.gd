# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#

#! @Chapter Expressions

#! @Section GAP categories

#! @Description
#!  The &GAP; category of symbolic expressions.
#!  Expressions are used to represent mathematical formulas symbolically,
#!  allowing operations like differentiation to be performed symbolically before evaluation.
DeclareCategory( "IsExpression", IsNearAdditiveElementWithInverse and IsAdditiveElement and IsMultiplicativeElement );

#! @Description
#!  The &GAP; category of constant expressions (expressions with no variables).
DeclareCategory( "IsConstantExpression", IsExpression );

#! @Section Constructors

#! @Description
#!  Create an expression from a list of <A>variables</A> and a <A>string</A> representation.
#! @Arguments variables, string
#! @Returns an expression
DeclareOperation( "Expression", [ IsDenseList, IsString ] );

#! @Description
#!  Create a constant expression from a <A>string</A>.
#!  The expression will have no variables and will also be registered as a global constant.
#! @Arguments string
#! @Returns a constant expression
DeclareOperation( "Expression", [ IsString ] );

#! @Section Attributes

#! @Description
#!  The list of variables of an expression.
#! @Arguments e
#! @Returns a list of strings
DeclareAttribute( "Variables", IsExpression );

#! @Description
#!  The string representation of an expression.
#! @Arguments e
#! @Returns a string
DeclareAttribute( "String", IsExpression );

#! @Description
#!  Convert an expression to a function that can be evaluated numerically.
#! @Arguments e
#! @Returns a function
DeclareAttribute( "AsFunction", IsExpression );

#! @Description
#!  Convert a string expression with given variables to a function.
#! @Arguments variables, string
#! @Returns a function
DeclareOperation( "AsFunction", [ IsDenseList, IsString ] );

#! @Section Operations

#! @Description
#!  Generate a list of dummy input strings using base name <A>var</A> with indices from 1 to <A>n</A>.
#!  For example, <C>DummyInputStrings("x", 3)</C> returns <C>["x1", "x2", "x3"]</C>.
#! @Arguments var, n
#! @Returns a list of strings
DeclareOperation( "DummyInputStrings", [ IsString, IsInt ] );

#! @Description
#!  Generate a list of dummy input expressions using base name <A>var</A> with indices from 1 to <A>n</A>.
#!  For example, <C>DummyInput("x", 3)</C> returns a list of three expressions x1, x2, x3.
#! @Arguments var, n
#! @Returns a list of expressions
DeclareOperation( "DummyInput", [ IsString, IsInt ] );

#! @Section Global functions

#! @Description
#!  Convert a list of constant values to a list of constant expressions.
#! @Arguments constants
#! @Returns a list of constant expressions
DeclareGlobalFunction( "ConvertToConstantExpressions" );

#! @Description
#!  Convert a list of variable name strings to a list of expressions.
#! @Arguments variables
#! @Returns a list of expressions
DeclareGlobalFunction( "ConvertToExpressions" );

#! @Description
#!  Assign each expression in <A>vars</A> to a global variable with the same name.
#! @Arguments vars
DeclareGlobalFunction( "AssignExpressions" );

#! @Section Global variables

#! @Description
#!  A list containing all globally defined constant expressions.
DeclareGlobalVariable( "LIST_OF_GLOBAL_CONSTANT_EXPRESSIONS" );

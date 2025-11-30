# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#

#! @Chapter Tools

#! @Section Mathematical operations

#! @Description
#!  The ReLU (Rectified Linear Unit) activation function.
#!  Returns <C>Maximum(a, 0)</C> for a float <A>a</A>.
#! @Arguments a
#! @Returns a float
DeclareOperation( "Relu", [ IsFloat ] );

#! @Section List operations

#! @Description
#!  Create enumerated pairs from a list.
#!  Returns a list of pairs <C>[i, l[i]]</C> for each element in <A>l</A>.
#! @Arguments l
#! @Returns a list of pairs
DeclareOperation( "Enumerate", [ IsDenseList ] );

#! @Description
#!  Split a dense list <A>l</A> according to the dimensions in <A>dims</A>.
#!  The sum of dimensions must equal the length of the list.
#! @Arguments l, dims
#! @Returns a list of lists
DeclareOperation( "SplitDenseList", [ IsDenseList, IsDenseList ] );

#! @Description
#!  Split a dense list <A>l</A> into sublists of size <A>n</A>.
#!  The length of <A>l</A> must be divisible by <A>n</A>.
#! @Arguments l, n
#! @Returns a list of lists
DeclareOperation( "SplitDenseList", [ IsDenseList, IsPosInt ] );

#! @Section Helper functions

#! @Description
#!  Return <A>x</A> if <A>bool</A> is true, otherwise return <A>y</A>.
#! @Arguments bool, x, y
#! @Returns either x or y
DeclareGlobalFunction( "SelectBasedOnCondition" );

#! @Description
#!  Call function <A>f</A> with arguments <A>l</A> if <A>bool</A> is true,
#!  otherwise call function <A>g</A> with arguments <A>l</A>.
#! @Arguments bool, f, g, l
#! @Returns the result of the called function
DeclareGlobalFunction( "CallFuncListBasedOnCondition" );

#! @Description
#!  The Kronecker delta function. Returns 1 if <A>a</A> equals <A>b</A>, otherwise 0.
#! @Arguments a, b
#! @Returns 0 or 1
DeclareGlobalFunction( "KroneckerDelta" );

#! @Description
#!  Multiply two matrices with explicit dimensions.
#!  <A>mat_1</A> is an <A>m_1</A> x <A>n_1</A> matrix,
#!  <A>mat_2</A> is an <A>m_2</A> x <A>n_2</A> matrix.
#!  Requires <A>n_1</A> = <A>m_2</A>.
#! @Arguments m_1, mat_1, n_1, m_2, mat_2, n_2
#! @Returns a matrix
DeclareGlobalFunction( "MultiplyMatrices" );

#! @Section Python integration

#! @Description
#!  Create a scatter plot using Python's matplotlib.
#!  <A>points</A> is a list of 2D points, <A>labels</A> is a list of class labels.
#! @Arguments points, labels
#! @Returns the directory containing the plot
DeclareOperation( "ScatterPlotUsingPython", [ IsDenseList, IsDenseList ] );

#! @Description
#!  Simplify expressions using Python's SymPy library.
#!  <A>vars</A> is a list of variable names, <A>exps</A> is a list of expression strings.
#! @Arguments vars, exps
#! @Returns a list of simplified expression strings
DeclareOperation( "SimplifyExpressionUsingPython", [ IsDenseList, IsDenseList ] );

#! @Description
#!  Compute the Jacobian matrix using Python's SymPy library.
#!  <A>vars</A> is a list of variable names, <A>exps</A> is a list of expression strings,
#!  <A>indices</A> specifies which variables to differentiate with respect to.
#! @Arguments vars, exps, indices
#! @Returns a matrix of derivative expressions
DeclareOperation( "JacobianMatrixUsingPython", [ IsDenseList, IsDenseList, IsDenseList ] );

#! @Description
#!  Compute a lazy Jacobian matrix (deferred computation).
#!  Returns a function that computes the Jacobian when evaluated.
#! @Arguments vars, exps, indices
#! @Returns a function
DeclareOperation( "LazyJacobianMatrix", [ IsDenseList, IsDenseList, IsDenseList ] );

#! @Description
#!  Convert expressions to LaTeX format using Python's SymPy library.
#!  <A>vars</A> is a list of variable names, <A>exps</A> is a list of expression strings.
#! @Arguments vars, exps
#! @Returns a list of LaTeX strings
DeclareOperation( "LaTeXOutputUsingPython", [ IsDenseList, IsDenseList ] );

#! @Section Differentiation

#! @Description
#!  Compute the lazy partial derivative of an expression with respect to the <A>i</A>-th variable.
#!  <A>vars</A> is a list of variable names, <A>str</A> is the expression string.
#! @Arguments vars, str, i
#! @Returns a function
DeclareOperation( "LazyDiff", [ IsDenseList, IsString, IsPosInt ] );

#! @Description
#!  Compute the partial derivative of an expression with respect to the <A>i</A>-th variable.
#!  <A>vars</A> is a list of variable names, <A>str</A> is the expression string.
#! @Arguments vars, str, i
#! @Returns a function
DeclareOperation( "Diff", [ IsDenseList, IsString, IsPosInt ] );

#! @Section Cython compilation

#! @Description
#!  Compile functions to Cython for improved performance.
#!  <A>vars</A> is a list of lists of variable names (one per function),
#!  <A>function_names</A> is a list of function names,
#!  <A>functions</A> is a list of function body strings.
#! @Arguments vars, function_names, functions
#! @Returns a string with instructions to use the compiled functions
DeclareOperation( "AsCythonFunction", [ IsDenseList, IsDenseList, IsDenseList ] );

# SPDX-License-Identifier: GPL-2.0-or-later
# GradientDescentForCAP: Exploring categorical machine learning in CAP
#
# Declarations
#


DeclareOperation( "Relu", [ IsFloat ] );
DeclareOperation( "Enumerate", [ IsDenseList ] );
DeclareOperation( "SplitDenseList", [ IsDenseList, IsDenseList ] );
DeclareOperation( "SplitDenseList", [ IsDenseList, IsPosInt ] );

DeclareGlobalFunction( "SelectBasedOnCondition" );
DeclareGlobalFunction( "CallFuncListBasedOnCondition" );
DeclareGlobalFunction( "KroneckerDelta" );
DeclareGlobalFunction( "MultiplyMatrices" );

DeclareOperation( "ScatterPlotUsingPython", [ IsDenseList, IsDenseList ] );
DeclareOperation( "SimplifyExpressionUsingPython", [ IsDenseList, IsDenseList ] );
DeclareOperation( "JacobianMatrixUsingPython", [ IsDenseList, IsDenseList, IsDenseList ] );
DeclareOperation( "LazyJacobianMatrix", [ IsDenseList, IsDenseList, IsDenseList ] );
DeclareOperation( "LaTeXOutputUsingPython", [ IsDenseList, IsDenseList ] );
DeclareOperation( "LazyDiff", [ IsDenseList, IsString, IsPosInt ] );
DeclareOperation( "Diff", [ IsDenseList, IsString, IsPosInt ] );

DeclareOperation( "AsCythonFunction", [ IsDenseList, IsDenseList, IsDenseList ] );

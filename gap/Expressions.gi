# SPDX-License-Identifier: GPL-2.0-or-later
# MachineLearningForCAP: Exploring categorical machine learning in CAP
#
# Implementations
#
DeclareRepresentation( "IsExpressionRep",
  IsExpression and IsAttributeStoringRep, [ ] );

##
BindGlobal( "TypeOfExpression",
  NewType( NewFamily( "FamilyOfExpressions", IsObject ), IsExpressionRep ) );

##
InstallGlobalFunction( Expression,
  
  function ( variables, string ) # list of variables, string
    
    return ObjectifyWithAttributes( rec( ), TypeOfExpression,
                Variables, variables,
                String, string );
    
end );

##
InstallOtherMethod( ViewString,
      [ IsExpression ],
  
  function ( e )
    local head, tail, str;
    
    head := Concatenation( "function ( ", JoinStringsWithSeparator( Variables( e ), ", " ), " ) return " );
    
    tail := "; end";
    
    str := String( EvalString( Concatenation( head, String( e ), tail ) ) );
    
    return str{[ Length( head ) + 1 .. Length( str ) - 5 ]};
    
end );

##
InstallGlobalFunction( ConvertToExpressions,
  
  variables -> List( variables, var -> Expression( variables, var ) )
);

##
InstallGlobalFunction( DummyInput,
  
  { var, n } -> ConvertToExpressions( List( [ 1 .. n ], i -> Concatenation( var, "", String( i ), "" ) ) )
);

##
InstallGlobalFunction( AssignExpressions,
  
  function ( vars )
    local func;
    
    func :=
      function ( e )
        local name;
        
        name := String( e );
        
        MakeReadWriteGlobal( name );
        
        DeclareSynonym( name, e );
        
        return true;
        
    end;
    
    List( vars, e -> func( e ) );
    
end );

##
InstallOtherMethod( AsFunction,
          [ IsDenseList, IsString ],
  
  function ( vars, str )
    
    return
      EvalString(
        Concatenation(
          Concatenation( "function( vec ) local ", JoinStringsWithSeparator( vars, ", " ), ";" ),
          Concatenation( ListN( [ 1 .. Length( vars ) ], i -> Concatenation( vars[i], " := vec[", String( i ), "]; " ) ) ),
          Concatenation( "return ", str, "; end" ) ) );
    
end );

##
InstallMethod( AsFunction,
          [ IsExpression ],
  
  e -> AsFunction( Variables( e ), String( e ) )
);

##
InstallOtherMethod( CallFuncList,
      [ IsExpression, IsDenseList ],
  
  { e, L } -> AsFunction( e )( L[1] )
);

## Apply Functions on Expressions
##

for op in [ "Sin", "Cos", "Exp", "Log", "Sqrt", "SignFloat", "Relu" ] do
  
  InstallOtherMethod( EvalString( op ),
        [ IsExpression ],
    
    EvalString( ReplacedString( "e -> Expression( Variables( e ), Concatenation( \"op\", \"(\", String( e ), \")\" ) )", "op", op ) )
  );
  
od;

## Operations on Expressions

##
InstallOtherMethod( AdditiveInverseMutable,
        [ IsExpression ],
  
  a -> Expression( Variables( a ), Concatenation( "-(", String( a ), ")" ) )
);

for op in [ "+", "-", "*", "/", "^" ] do
  
  ##
  InstallOtherMethod( EvalString( Concatenation( "\\", op ) ),
          [ IsExpression, IsExpression ],
    
    EvalString( ReplacedString( "{ a, b } -> Expression( Variables( a ), Concatenation( \"(\", String( a ), \")op(\", String( b ), \")\" ) )", "op", op ) )
  );

  ##
  InstallOtherMethod( EvalString( Concatenation( "\\", op ) ),
          [ IsObject, IsExpression ],
    
    EvalString( ReplacedString( "{ a, b } -> Expression( Variables( b ), String( a ) ) op b", "op", op ) )
  );
  
  ##
  InstallOtherMethod( EvalString( Concatenation( "\\", op ) ),
          [ IsExpression, IsObject ],
    
    EvalString( ReplacedString( "{ a, b } -> a op Expression( Variables( a ), String( b ) )", "op", op ) )
  );
  
od;

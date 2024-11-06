% Definição das probabilidades para Str (Condição da rua)
0.6::str(dry); 0.3::str(wet); 0.1::str(snow_covered).

% Probabilidade de Flw (Volante do Dínamo desgastado)
0.3::flw.

% Probabilidades condicionais para R (Dínamo deslizante)
0.3::r :- str(dry), flw.
0.1::r :- str(dry), \+flw.
0.6::r :- str(wet), flw.
0.4::r :- str(wet), \+flw.
0.9::r :- str(snow_covered), flw.
0.7::r :- str(snow_covered), \+flw.

% Probabilidades condicionais para V (Dínamo mostra tensão)
0.2::v :- r.
0.9::v :- \+r.

% Probabilidades para B (Lâmpada ok) e K (Cabo ok)
0.95::b.
0.98::k.

% Probabilidades condicionais para Li (Luz ligada)
0.99::li :- v, b, k.
0.01::li :- v, b, \+k.
0.01::li :- v, \+b, k.
0.001::li :- v, \+b, \+k.
0.3::li :- \+v, b, k.
0.005::li :- \+v, b, \+k.
0.005::li :- \+v, \+b, k.
0.0::li :- \+v, \+b, \+k.

% Consulta para calcular P(V | Str = snow_covered)
query(v) :- str(snow_covered).

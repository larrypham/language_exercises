-module(fact).      % This is the file 'fact.erl', the module and the filename MUST match.
-export([fac/1]).   % This exports the function 'fac' of arity 1 (1 parameter, no type, no value).

fac(0) -> 1;        % If 0, then return 1, otherwise (note the semicolon ; meaning 'else')
fac(N) when N > 0 -> 
    N * fac(N-1).

% Recursively determine, then return the result
% (note the period . meaning 'endif' or 'function end')

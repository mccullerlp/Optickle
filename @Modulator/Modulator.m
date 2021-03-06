% Modulator is a type of Optic used in Optickle
%
% Modulators can be used to modulate a beam.  These are not for
% continuous modulation (i.e., for making RF sidebands), but rather
% for measuring transfer functions (e.g., for frequency or intensity
% noise couplings).
%
% obj = Modulator(name, cMod)
%
% A modulator has 1 input and 1 output.
% Input:  1, in
% Output: 1, out
%
% ==== Members
% Optic - base class members
% cMod - modulation coefficient (1 for amplitude, i for phase)
%        this must be either a scalar, which is applied to all RF
%        field components, or a vector giving coefficients for each
%        RF field component.
%          amplitude modulation or noise = 2 * RIN
%          phase modulation in radians
% Nmod - length(cMod)
%
% ==== Functions, those in Optic
%
%% Example: an amplitude modulator
% obj = Modulator('ModAM', 1);

function obj = Modulator(varargin)

  obj = struct('Nmod', 0, 'cMod', []);
  obj = class(obj, 'Modulator', Optic);

  errstr = 'Don''t know what to do with ';	% for argument error messages
  switch( nargin )
    case 0					% default constructor, do nothing
    case 1
      % ==== copy constructor
      arg = varargin{1};
      if( isa(arg, class(obj)) )
        obj = arg;
      else
        error([errstr 'a %s.'], class(arg));
      end
    case 2
      % ==== name, cMod
      [name, obj.cMod] = deal(varargin{:});
      
      % build optic
      obj.Optic = Optic(name, {'in'}, {'out'}, {'drive'});

      % assign class data
      obj.Nmod = length(obj.cMod);
    otherwise
      % wrong number of input args
      error([errstr '%d input arguments.'], nargin);
  end

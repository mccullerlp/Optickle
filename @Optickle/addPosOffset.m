% add to the position offset of optic's drive or drives
% 
% opt = addPosOffset(opt, name, pos)
% snOpt - name or serial number of an optic
% pos - addition to zero position for this optic
%
% How it works:
%  sn = getSerialNum(opt, name);
%  opt.optic{sn} = addPosOffset(opt.optic{sn}, pos);


function opt = addPosOffset(opt, name, pos)

  sn = getSerialNum(opt, name);
  opt.optic{sn} = addPosOffset(opt.optic{sn}, pos);

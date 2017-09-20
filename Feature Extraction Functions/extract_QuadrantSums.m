function [q1, q2, q3, q4] = extract_QuadrantSums(glyph)
% [q1, q2, q3, q4] = extract_QuadrantSums(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

q1r1 = 1;
q1r2 = ceil(dims(1)/2);
q1c1 = 1;
q1c2 = ceil(dims(2)/2);

q2r1 = 1;
q2r2 = ceil(dims(1)/2);
q2c1 = floor(dims(2)/2) + 1;
q2c2 = dims(2);

q3r1 = floor(dims(1)/2) + 1;
q3r2 = dims(1);
q3c1 = 1;
q3c2 = ceil(dims(2)/2);

q4r1 = floor(dims(1)/2) + 1;
q4r2 = dims(1);
q4c1 = floor(dims(2)/2) + 1;
q4c2 = dims(2);

q1 = sum(sum(map(q1r1:q1r2,q1c1:q1c2)));
q2 = sum(sum(map(q2r1:q2r2,q2c1:q2c2)));
q3 = sum(sum(map(q3r1:q3r2,q3c1:q3c2)));
q4 = sum(sum(map(q4r1:q4r2,q4c1:q4c2)));

end


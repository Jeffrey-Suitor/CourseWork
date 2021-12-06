function output = translate_frame(directions)
% Create a translation frame based on a set of directions
    output = [1 0 0 directions(1);
              0 1 0 directions(2);
              0 0 1 directions(3);
              0 0 0 1];
end
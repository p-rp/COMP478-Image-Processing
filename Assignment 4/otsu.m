function [result] = otsu(image)
  histogram = imhist(image);

  totalPixels = numel(image);

  maxBetweenClassVariance = 0;
  optimalThreshold = 0;

  % Iterate through possible thresholds
  for t = 1:256
      % Class probabilities
      w0 = sum(histogram(1:t)) / totalPixels;
      w1 = sum(histogram(t+1:end)) / totalPixels;

      % Class mean intensities
      u0 = sum((0:(t-1))' .* histogram(1:t)) / (w0 * totalPixels);
      u1 = sum((t:255)' .* histogram(t+1:end)) / (w1 * totalPixels);

      % Between-class variance
      betweenClassVariance = w0 * w1 * (u0 - u1)^2;

      % Check if the variance is greater than the current maximum
      if betweenClassVariance > maxBetweenClassVariance
          maxBetweenClassVariance = betweenClassVariance;
          optimalThreshold = t - 1; % MATLAB indexing starts from 1
      endif
  endfor

  % Apply the optimal threshold
  result = image > optimalThreshold;


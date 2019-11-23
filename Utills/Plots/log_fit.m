function [fitresult, gof] = log_fit(durations, means)

    [xData, yData] = prepareCurveData( durations, means );

    % Set up fittype and options.
    ft = fittype( '1 /(1 + exp(-k*(x-m)))', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Algorithm = 'Levenberg-Marquardt';
    opts.Display = 'Off';
    opts.StartPoint = [5 mean(minmax(durations))];

    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );

end




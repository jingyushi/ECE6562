function path = randomcurve(n,m)
    step = (2.5.*rand(n,2)-1).*m./n;
    path = cumsum(step);
    path(:,1) = smooth(path(:,1));
    path(:,2) = smooth(path(:,2));
end
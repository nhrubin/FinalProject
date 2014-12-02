function d = distVec(vec1, vec2)
%     vec2 = shiftdim(vec2,1);
    diff = vec2-vec1;
%     diff(isnan(diff)) = [];
%     nans = isnan(vec1)+isnan(vec2);
%     vec1(nans>0) = [];
%     vec2(nans>0) = [];
    d = nansum((diff).^2);
    if (isnan(d))
        disp('NaN');
    end
    d = d/size(vec1,2);
end


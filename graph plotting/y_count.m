function [out] = y_count(i, len)

if(i < len)
    out = 1;
end

count = 1;
while(i > len)
    i = i - len;
    count = count + 1;
end

if (i == 0)
    i = i + len;
    count = count - 1;
end
out = count;
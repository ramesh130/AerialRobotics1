function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************
%P1_edge1;
[m,c,b] = lin_eq(P1(1,1), P1(1,2), P1(2,1), P1(2,2));
flag = edge_intersection(m, c, b, P1, P2);
if(~flag) 
    return; 
end

%P1_edge2;
[m,c,b] = lin_eq(P1(1,1), P1(1,2), P1(3,1), P1(3,2));
flag = edge_intersection(m, c, b, P1, P2);
if(~flag) 
    return; 
end

%P1_edge3;
[m,c,b] = lin_eq(P1(2,1), P1(2,2), P1(3,1), P1(3,2));
flag = edge_intersection(m, c, b, P1, P2);
if(~flag) 
    return; 
end

%P2_edge1;
[m,c,b] = lin_eq(P2(1,1), P1(1,2), P2(2,1), P2(2,2));
flag = edge_intersection(m, c, b, P2, P1);
if(~flag) 
    return; 
end

%P2_edge2;
[m,c,b] = lin_eq(P2(1,1), P2(1,2), P2(3,1), P2(3,2));
flag = edge_intersection(m, c, b, P2, P1);
if(~flag) 
    return; 
end

%P2_edge3;
[m,c,b] = lin_eq(P2(2,1), P2(2,2), P2(3,1), P2(3,2));
flag = edge_intersection(m, c, b, P2, P1);
if(~flag) 
    return; 
end

%flag = false;
% *******************************************************************
end

function [m, c, b] = lin_eq(x1, y1, x2, y2)
% mx + by + c = 0 - eq of straight line
if(x1 == x2)
    m = 1;
    c = -x1;
    b = 0;
else
    m = (y2 - y1)/(x2 - x1);
    b = -1;
    c = -1*(m*x1 + b*y1);%c = y1 - mx1;
end
end

function flag = edge_intersection(m, c, b, P1, P2)
dir_p1 = zeros(1, 3);
for i = 1:3
    dir_p1(i) = compute_lin(m, c, b, P1(i, 1), P1(i, 2));
end

dir_p2 = zeros(1, 3);
for i = 1:3
    dir_p2(i) = compute_lin(m, c, b, P2(i, 1), P2(i, 2));
end

flag_p1 = compute_dir_self(dir_p1);
flag_p2 = compute_dir(dir_p2);

%if(flag_p1 == 2 || flag_p2 == 2)
if(flag_p2 == 2) %intersect
    flag = true;
elseif(flag_p1 == flag_p2) %on same side
    flag = true;
else
    flag = false;
end
end

function val = compute_lin(m, c, b, x, y)
val = m*x + b*y + c;
end

function flag = compute_dir(P)
if all(P > 0)
    flag = 0; %right
elseif all(P < 0)
    flag = 1; %left
else
    flag = 2; %intersect
end
end

function flag = compute_dir_self(P)
if all(P >= 0)
    flag = 0; %right
elseif all(P <= 0)
    flag = 1; %left
else
    flag = 2; %intersect
end
end
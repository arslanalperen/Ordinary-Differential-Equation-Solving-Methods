clc;clear all;

V = 12;
L = 0.98;
R = 14.2;

%Delta t = 0.050

t = (0:0.05:0.6);
dt = 0.05;
I(1,1) = 0.1;

%eulers method

for i=2:1:13
    di = (V/L)-((R/L)*I(i-1:i-1,1));
    I(i:i,1) = I(i-1:i-1,1) + di*dt;
end

figure(1);
subplot(2,2,1);
plot(t,I(:,1));
grid;
title("Euler's Method");
xlabel("Time [t]");
ylabel("Current [A]");

%modified eulers method

I(1,2) = 0.1;

for i=2:1:13
    di = (V/L)-((R/L)*I(i-1:i-1,2));
    dii = (V/L)-((R*I(i:i,1))/L);
    I(i:i,2) =  I(i-1:i-1,2) + (dt/2)*(di+dii);
end

subplot(2,2,2);
plot(t,I(:,2));
grid;
title("Modified Euler's Method");
xlabel("Time [t]");
ylabel("Current [A]");

%midpoint method

I(1,3) = 0.1;

for i=2:1:13
    di = (V/L)-((R/L)*I(i-1:i-1,2));
    dii = (V/L)-((R*(I(i-1:i-1,3)+(dt/2)*di))/L);
    I(i:i,3) =  I(i-1:i-1,3) + dt*dii;
end

subplot(2,2,3);
plot(t,I(:,3));
grid;
title("Midpoint Method");
xlabel("Time [t]");
ylabel("Current [A]");
sgtitle("Delta t = 0.050 s");

%runge kutta order 4 method

I(1,4) = 0.1;

for i=2:1:13
    di = (V/L)-((R/L)*I(i-1:i-1,4));
    K1 = dt*di;
    di = (V/L)-((R/L)*(I(i-1:i-1,4)+(K1/2)));
    K2 = dt*di;
    di = (V/L)-((R/L)*(I(i-1:i-1,4)+(K2/2)));
    K3 = dt*di;
    di = (V/L)-((R/L)*(I(i-1:i-1,4)+K3));
    K4 = dt*di;
    I(i:i,4) =  I(i-1:i-1,4) + K1/6 + K2/3 + K3/3 + K4/6;
end

subplot(2,2,4);
plot(t,I(:,4));
grid;
title("Runge Kutta Order 4 Method");
xlabel("Time [t]");
ylabel("Current [A]");

%Analytic Solve

C = 0.1 - V/R;

I(1,5) = 0.1;

for i=2:1:13
    I(i:i,5) = (V/R) + C*exp((-R/L)*t(i));
end

figure(2);
plot(t,I(:,1),"b-");
hold on
plot(t,I(:,2),"g--");
hold on
plot(t,I(:,3),"r-.");
hold on
plot(t,I(:,4),"yo");
hold on
plot(t,I(:,5),"k.");
grid;
xlabel("Time [t]");
ylabel("Current [A]");
legend("Euler's","Modified Euler's","Midpoint","RK4","Analytic Solution");
title("Delta t = 0.050 s");

%Norms

a = 0;

for i=1:1:13
    fprintf("Delta t = 0.050 s\n\n");
    fprintf("t = %f\n",a);
    a = i*dt;
    fprintf('Euler: %f\n',norm((I(i:i,1)-I(i:i,5))/I(i:i,5)));
    Norms(i:i,1) = norm((I(i:i,1)-I(i:i,5))/I(i:i,5));
    fprintf('Modified: %f\n',norm((I(i:i,2)-I(i:i,5))/I(i:i,5)));
    Norms(i:i,2) = norm((I(i:i,2)-I(i:i,5))/I(i:i,5));
    fprintf('Midpoint: %f\n',norm((I(i:i,3)-I(i:i,5))/I(i:i,5)));
    Norms(i:i,3) = norm((I(i:i,3)-I(i:i,5))/I(i:i,5));
    fprintf('RK Order 4: %f\n',norm((I(i:i,4)-I(i:i,5))/I(i:i,5)));
    Norms(i:i,4) = norm((I(i:i,4)-I(i:i,5))/I(i:i,5));
    fprintf("---------------------------------------------------------\n");
end

%Delta t = 0.025

t2 = (0:0.025:0.6);
dt = 0.025;
I2(1,1) = 0.1;

%eulers method

for i=2:1:25
    di = (V/L)-((R/L)*I2(i-1:i-1,1));
    I2(i:i,1) = I2(i-1:i-1,1) + di*dt;
end

figure(3);
subplot(2,2,1);
plot(t2,I2(:,1));
grid;
title("Euler's Method");
xlabel("Time [t]");
ylabel("Current [A]");

%modified eulers method

I2(1,2) = 0.1;

for i=2:1:25
    di = (V/L)-((R/L)*I2(i-1:i-1,2));
    dii = (V/L)-((R*I2(i:i,1))/L);
    I2(i:i,2) =  I2(i-1:i-1,2) + (dt/2)*(di+dii);
end

subplot(2,2,2);
plot(t2,I2(:,2));
grid;
title("Modified Euler's Method");
xlabel("Time [t]");
ylabel("Current [A]");

%midpoint method

I2(1,3) = 0.1;

for i=2:1:25
    di = (V/L)-((R/L)*I2(i-1:i-1,2));
    dii = (V/L)-((R*(I2(i-1:i-1,3)+(dt/2)*di))/L);
    I2(i:i,3) =  I2(i-1:i-1,3) + dt*dii;
end

subplot(2,2,3);
plot(t2,I2(:,3));
grid;
title("Midpoint Method");
xlabel("Time [t]");
ylabel("Current [A]");
sgtitle("Delta t = 0.025 s");

%runge kutta order 4 method

I2(1,4) = 0.1;

for i=2:1:25
    di = (V/L)-((R/L)*I2(i-1:i-1,4));
    K1 = dt*di;
    di = (V/L)-((R/L)*(I2(i-1:i-1,4)+(K1/2)));
    K2 = dt*di;
    di = (V/L)-((R/L)*(I2(i-1:i-1,4)+(K2/2)));
    K3 = dt*di;
    di = (V/L)-((R/L)*(I2(i-1:i-1,4)+K3));
    K4 = dt*di;
    I2(i:i,4) =  I2(i-1:i-1,4) + K1/6 + K2/3 + K3/3 + K4/6;
end

subplot(2,2,4);
plot(t2,I2(:,4));
grid;
title("Runge Kutta Order 4 Method");
xlabel("Time [t]");
ylabel("Current [A]");

%Analytic Solve

C = 0.1 - V/R;

I2(1,5) = 0.1;

for i=2:1:25
    I2(i:i,5) = (V/R) + C*exp((-R/L)*t2(i));
end

figure(4);
plot(t2,I2(:,1),"b-");
hold on
plot(t2,I2(:,2),"g--");
hold on
plot(t2,I2(:,3),"r-.");
hold on
plot(t2,I2(:,4),"yo");
hold on
plot(t2,I2(:,5),"k.");
grid;
xlabel("Time [t]");
ylabel("Current [A]");
legend("Euler's","Modified Euler's","Midpoint","RK4","Analytic Solution");
title("Delta t = 0.025 s");

a = 0;

%Norms

fprintf("\n\n-----------------------------------------------------------");
fprintf("\n");
fprintf("-----------------------------------------------------------\n\n");
fprintf("\n");

for i=1:1:25
    fprintf("Delta t = 0.025 s\n\n");
    fprintf("t = %f\n",a);
    a = i*dt;
    fprintf('Euler: %f\n',norm((I2(i:i,1)-I2(i:i,5))/I2(i:i,5)));
    Norms2(i:i,1) = norm((I2(i:i,1)-I2(i:i,5))/I2(i:i,5));
    fprintf('Modified: %f\n',norm((I2(i:i,2)-I2(i:i,5))/I2(i:i,5)));
    Norms2(i:i,2) = norm((I2(i:i,2)-I2(i:i,5))/I2(i:i,5));
    fprintf('Midpoint: %f\n',norm((I2(i:i,3)-I2(i:i,5))/I2(i:i,5)));
    Norms2(i:i,3) = norm((I2(i:i,3)-I2(i:i,5))/I2(i:i,5));
    fprintf('RK Order 4: %f\n',norm((I2(i:i,4)-I2(i:i,5))/I2(i:i,5)));
    Norms2(i:i,4) = norm((I2(i:i,4)-I2(i:i,5))/I2(i:i,5));
    fprintf("---------------------------------------------------------\n");
end
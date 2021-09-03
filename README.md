# Ordinary Differential Equation Solving Methods  
**<h1>Purpose</h1>**  

Transient response, which consists of natural and step responses, of an RL circuit wtih a DC voltage source V_S , an inductance L, and a resistance R, as shown in Figure 1, can be determined by solving the following ordinary differential equation (ODE) with the initial current i_0 as the initial condition:

V_S=L d/dx i(t)+Ri(t),   i(t_0 )= i_0    (1)

Where i(t) is the current. In Figure 1, the switch is closed at t= t_0

![1](/images/1.png)  

Should be written a code to calculate the current i(t) for V_S=12 V, L=0.98 H, R=14.2 Ω, t_0=0 s, and i_0=100 mA by solving the equation (1) fort he time interval t ∈[0,600]  ms using Euler’s Method, Modified Euler’s Method, Midpoint Method and Runge-Kutta Method Order Four and should be answering the following questions:

	Write the problem given in equation (1) in the form of an initial value problem.
	Find the analytical solution of the problem given in equation (1).
	Solve the problem for the step size Δt=0.05 s using the methods mentioned
	above.
	Solve the problem for the step size Δt=0.025 s using the methods mentioned
	above.
	Plot and compare all results in terms of error and convergence.  

**<h1>Preparatory Work</h1>**  

The above LR series circuit is connected across a constant voltage source, (the battery) and a switch. Assume that the switch, S is open until it is closed at a time t = 0, and then remains permanently closed producing a “step response” type voltage input. The current, i begins to flow through the circuit but does not rise rapidly to its maximum value of i_max as determined by the ratio of V / R (Ohms Law).

This limiting factor is due to the presence of the self induced emf within the inductor as a result of the growth of magnetic flux, (Lenz’s Law). After a time the voltage source neutralizes the effect of the self induced emf, the current flow becomes constant and the induced current and field are reduced to zero.

We can use Kirchhoff’s Voltage Law, (KVL) to define the individual voltage drops that exist around the circuit and then hopefully use it to give us an expression for the flow of current.
Kirchhoff’s voltage law (KVL) gives us:

V_t-(V_R+V_L )=0  (2)

The voltage drop across the resistor, R is I*R (Ohms Law).

V_R=I ×R  (3)

The voltage drop across the inductor, L is by now our familiar expression L(di/dt)

V_l=L di/dt   (4)

Then the final expression for the individual voltage drops around the LR series circuit can be given as:
V_t=I(t)R+L di/dt    (5)

At this point, the equation given is reached.  

**<h1>Analysis</h1>**  

The given equation and also obtained in the preparatory work section can be solved as a differential equation.

i^'+R/L  i=E/L     (6)

Equation 5 can be written as equation 6. If equation 6 is multiplied by the integral factor and the integral is taken, equation 7 is obtained.

i(t)= e^(-R) [∫〖e^R  E/L  dt+c〗]    (7)
i(t)= e^(-R/L t) [1/R ∫〖e^(R/L t)  ER/L  dt+c〗]    (8)
i(t)= e^(-R/L t) [E/R ∫〖e^(R/L t)  R/L  dt+c〗]    (9)
i(t)= e^(-R/L t) [E/R  e^(R/L t)+c]    (10)
i(t)=E/R+c e^(-R/L t)    (11)

It can be found by writing the constant C in Equation 11 instead of the given values. At time t_0=0 ,i_0=100 mA was given. Using this initial value, the constant C can be found.

100 mA=(12 V)/(14.2 Ω)+c e^(-(14.2 Ω)/(0.98 H)  0)    (12)
100 mA=(12 V)/(14.2 Ω)+c   (13)
c= -0.74…   (14)

By substituting the C constant in equation 14 into equation 11, the current value for each time period can be found in this circuit. Equation 5 is wanted to be solved by 4 different numerical methods. The reason for using these methods is to find the current value in the next time period. It can be started to solve with Euler's Method. Euler’s Method formula:

y_(i+1)= y_i+h f(t_i,y_i )   (14)

Equation 14 is given the formula of Euler's Method. The value h represents the time step. The methods were asked to be solved with two different time steps. The methods will be solved first by 0.050 s and then by 0.025 s.  

![2](/images/2.png)  

As seen in Figure 2, variables are defined in the first part of the code. V,L,and R are variables to be used throughout the entire script. The t and dt are variables to be used in the methods to be solved using the 0.050 s time step. The current values of the methods to be solved with a time step of 0.050 s were assigned to the I matrix. The values in the first column of the I matrix will be Euler's Method, the values in the second column will be Modified Euler's Method, the values in the third column will be Midpoint method, the values in the fourth column will be the Runge-Kutta Method, and the values in the fifth column will be the current values of the analytical solution.  

![3](/images/3.png)  

The method is applied for each time step in the for loop (Figure 3). The value of the derivative expression in Euler's method is calculated and assigned to the variable di, and then applied in Euler's formula and assigned to the I matrix. Then the graph of these values is also plotted.

 The graphics of the methods will be displayed after the code of all methods is explained.

In the for loop, Modified Euler's method is applied for each time step (Figure 4).  

![4](/images/4.png)  

Modified Euler's method formula contains two different derivative expressions. These derivative values have been calculated and assigned to the variables di and dii. These values are substituted in the formula and assigned to the I matrix.  

![5](/images/5.png)  

Midpoint method formula contains two different derivative expressions. A derivative is taken by using the current value calculated at the previous time value and the resulting result is derivatized again. The last result is used in the formula. In the for loop (Figure 5), the first derivative expression is assigned to the variable di, and the next derivative expression to the variable dii. Finally, the current has been assigned to the I matrix of the value by putting the variables in their places.  

![6](/images/6.png)  

The formula of the Runge Kutta 4th order method is applied for every step in the for loop (Figure 6). The K values calculated in the Runge Kutta 4th degree method are also applied in the code and assigned to the variables. Finally, the K values were put in the formula and the current values were recorded in the I matrix.

In the previous pages of the report, the RL circuit voltage equation was solved differentially and the C constant was calculated (Equation 11). Analytical solution can be made using this equation and the calculated values can be used in error calculation.  

![7](/images/7.png)  

The analytical solution for each step is built as shown in Figure 7. The process was done in Matlab to use the full value of the constant C. The equation is solved in the for loop and assigned to the I matrix. Later, the graphics of the related methods were also drawn.  

![8](/images/8.png)  

The results of the methods used are shown in Figure 8. The first column is the Euler's method, the second column is the Modified Euler's method, the third column is the Midpoint method, the fourth column is the Runge-Kutta 4th order method, and the fifth column is the current values of the analytical solution.  

![9](/images/9.png)  

The graphics created by the current values of the related methods are shown in Figure 9. Since it will be difficult to make comparisons from single graphs, the graphs will be displayed on a single figure.  

![10](/images/10.png)  

When the graph given in Figure 10 is examined, it can be seen that the Runge-Kutta 4th order method is very close to the analytical solution. They are drawn with a circle and a point to better see their location. If the methods are listed as convergence to the analytical solution:

1.	Runge-Kutta Method Order Four
2.	Midpoint Method
3.	Modified Euler’s Method
4.	Euler’s Method

The error can be calculated to see which method is better at convergence. The norm function will be used for error calculation.  

![11](/images/11.png)  

As can be seen in Figure 11, the norm of the current values found by each method in each time interval is taken according to the analytical solution. It can be seen that these values are properly written into the command window and at the same time, each norm value is also saved in the Norm matrix to appear in a tabular form. Norm matrix values can be displayed so that all norm values can be displayed properly.  

![12](/images/12.png)  

In Figure 12, all norm values of the norm are given. The first column the Euler method, the second column for the Modified Euler method, the third column for the Midpoint method, and the fourth column is the norm values for the Runge-Kutta 4th order method. As the norm values approach 0, the accuracy of the method increases. When looking at the values in Figure 12, it can be seen that the accuracy of the Runge-Kutta 4th degree method is higher than the other methods.

All methods applied for Delta t = 0.050 s are also applicable for Delta t = 0.025 s. Only dt value is made 0.025 s on the code. All other lines of code are the same. In order not to lose some values calculated at 0.050 s, an I2 matrix equivalent to the I matrix and a t2 vector similar to the t vector were created in the code written for 0.025. The time interval given for 0.025 time steps will be 25 pieces. So the for loops used were returned 25 times instead of 13. Since there is no change other than the changes mentioned in the code, the code blocks will not be explained and the directly calculated values will be given.  

![13](/images/13.png)  

Currents of the methods calculated with 0.025 s time step are given in figure 13. The first column is the Euler's method, the second column is the Modified Euler's method, the third column is the Midpoint method, the fourth column is the Runge-Kutta 4th order method, and the fifth column is the current values of the analytical solution.  

![14](/images/14.png)  

The graphics created by the current values of the related methods are shown in Figure 14. Since it will be difficult to make comparisons from single graphs, the graphs will be displayed on a single figure.  

![15](/images/15.png)  

When the graph given in Figure 15 is examined, it can be seen that the Runge-Kutta 4th order method is very close to the analytical solution. They are drawn with a circle and a point to better see their location. If the methods are listed as convergence to the analytical solution:

1.	Runge-Kutta Method Order Four
2.	Midpoint Method
3.	Modified Euler’s Method
4.	Euler’s Method

4 different methods were solved for 2 different time steps and plotted. When Figure 10 and Figure 15 are compared, it can be seen that the graphs of the methods calculated with 0.025 time steps follow more parabolic paths. The reason for this is obvious. Using a 0.025 s time step will result in more processing in the given interval compared to a 0.050 s time step. This will allow the data to progress in shorter steps and the path followed by the data will be parabolic. Therefore, using smaller time steps when using methods will increase the accuracy of the calculation.


The error can be calculated to see which method is better at convergence. The norm function will be used for error calculation.  

![16](/images/16.png)  

In Figure 16, all norm values of the norm are given. The first column the Euler method, the second column for the Modified Euler method, the third column for the Midpoint method, and the fourth column is the norm values for the Runge-Kutta 4th order method. As the norm values approach 0, the accuracy of the method increases. When looking at the values in Figure 16, it can be seen that the accuracy of the Runge-Kutta 4th degree method is higher than the other methods.  

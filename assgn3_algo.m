function [F, M] = controller(t, state, des_state, params)
%CONTROLLER  Controller for the quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [x; y; z], state.vel = [x_dot; y_dot; z_dot],
%   state.rot = [phi; theta; psi], state.omega = [p; q; r]
%
%   des_state: The desired states are:
%   des_state.pos = [x; y; z], des_state.vel = [x_dot; y_dot; z_dot],
%   des_state.acc = [x_ddot; y_ddot; z_ddot], des_state.yaw,
%   des_state.yaw_dot
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls


% =================== Your code goes here ===================
% mass: 0.1800
% I: [3x3 double]
% invI: [3x3 double]
% gravity: 9.8100
% arm_length: 0.0860
% minF: 0
% maxF: 3.5316

g = params.gravity;
m = params.mass;

% Thurst

%Derivative constant
Kdz = 0;
%Proportion constant
Kpz = 0;

%Current values
z = state.pos(3);
z_dot = state.vel(3);

%Desired values
z_t = des_state.pos(3);
z_dot_t = des_state.vel(3);
z_ddot_t = des_state.acc(3);

%Compute thrust
%F =  %Use formula from assgn 2

% Moment

%Constants
Kdx = 0;
Kpx = 0;
Kdy = 0;
Kpy = 0;

%Current state
rx = state.pos(1);
rx_dot = state.vel(1);

ry = state.pos(2);
ry_dot = state.vel(2);

%Desired state
rx_des = des_state.pos(1);
rx_dot_des = des_state.vel(1);
rx_ddot_des = des_state.acc(1);

ry_des = des_state.pos(2);
ry_dot_des = des_state.vel(2);
ry_ddot_des = des_state.acc(2);

%Commanded State
%rx_ddot_c = %Use eqn 11 from handout
%ry_ddot_c = %Use eqn 11 from handout

%Constants
Kdphi = 0;
Kpphi = 0;
Kdtheta = 0;
Kptheta = 0;
Kdsigh = 0;
Kpsigh = 0;

%Current roll, pitch and yaw
phi = state.rot(1);
theta = state.rot(2);
sigh = state.rot(3);

%Desired roll, pitch and yaw
phi_des = 0; %Unused
theta_des = 0; %Unused
sigh_des = des_state.yaw;

%Commanded roll, pitch and yaw
%phi_c = %Use eqn 14-a from handout
%theta_c = %Use eqn 14-b from handout
sigh_c = sigh_des;

%Current Angular velocities
p = state.omega(1);
q = state.omega(2);
r = state.omega(3);

%Desired Angular velocities
p_des = 0;
q_des = 0;
r_des = des_state.yawdot;

%Comanded Angular velocities
p_c = 0;
q_c = 0;
r_c = r_des;

%Compute moment elements
%u2_11 = %Use eqn 10 from handout
%u2_21 = %Use eqn 10 from handout
%u2_31 = %Use eqn 10 from handout

M = [u2_11;u2_21;u2_31];

% =================== Your code ends here ===================

end

# Mobile Robot using Simulink

## 1. Introduction and System Overview

* **Mobile Robot**: A robot capable of moving between locations, perceiving the environment via sensors, and performing tasks accordingly.
* Example application: **Line-following wheelchair** to assist people with disabilities.
* **Input**: control voltage → **Actuator**: DC motor (PMDC) → **Output**: wheel rotational speed.
* Analysis, design, and simulation are conducted using **MATLAB**.

---

## 2. Mathematical Modeling

* **Electrical part**:

  * Torque: $T_m = K_t i_a$
  * Back EMF: $e_a(t) = K_b \omega$
  * Voltage equation derived from Kirchhoff’s law.
* **Mechanical part**:

  * Torque balance: $K_t i_a - b_m\omega - J_m \alpha = 0$
* **Combined model**: Produces **transfer function** $G_{speed}(s)$ from input voltage to wheel speed (with and without load).

---

## 3. Simulation Response

### System **without control**

* High overshoot (\~30–40%), underdamped oscillations, settling time \~5s.
* Observed variables: torque, current, linear speed, angular speed → all stabilize after \~5s but performance is not optimal.

---

## 4. PID Control

* Improves stability, increases steady-state values, reduces oscillations.
* Still has an initial overshoot, but within acceptable limits.
* Settling time \~5s, smoother response compared to open-loop.

---

## 5. PI Control

* Parameters: **Kp = 22, Ki = 50**.
* Similar characteristics to PID but with a simpler structure; still shows small initial oscillations.
* Settling time \~5s, zero steady-state error due to the integral term.

---

## 6. PID vs PI Comparison

| Criterion                        | PID                              | PI                   |
| -------------------------------- | -------------------------------- | -------------------- |
| Speed settling time              | \~1.8–2.0s                       | \~1.8–2.0s           |
| Speed overshoot                  | Very small                       | Very small           |
| Steady-state error               | Zero                             | Zero                 |
| Torque/current oscillation       | Quickly damped                   | Quickly damped       |
| Complexity                       | Higher (3 parameters)            | Lower (2 parameters) |
| High-frequency noise sensitivity | More sensitive (derivative term) | Less sensitive       |
| Anticipation/damping             | Better (derivative term)         | Weaker (no D term)   |

**Conclusion**:

* **Choose PID**: When the system tends to oscillate, needs very fast response, and requires strong damping & anticipation.
* **Choose PI**: When performance requirements can be met without derivative action—simpler tuning, less sensitive to high-frequency noise.

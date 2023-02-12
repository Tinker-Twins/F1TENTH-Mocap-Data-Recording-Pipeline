| ![F1TENTH](https://user-images.githubusercontent.com/40835293/218337806-9a306baf-83a3-45a2-a92b-b269086cff5d.png) | ![OptiTrack](https://user-images.githubusercontent.com/40835293/209375755-af73b9ab-a2f4-4082-967c-51be455d555c.png) |
| :--------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------: |

Multiple experiments were conducted to calibrate the vehicle and it was verified with a multitude of runs using the OptiTrack motion capture system as ground truth benchmark. Datasets were collected for open-loop vehicle control (skidpad, fishhook and slalom maneuvers) as well as random teleoperation sequences using the calibrated vehicle. It is to be noted that the control inputs applied to the vehicle included linear velocity (m/s) and steering angle (rad), which is a common practice followed across various vehicle dynamics experiments for Ackermann-steered vehicles.

Datasets were collected by throttling the topics at 60 Hz (for open-loop control) and 10 Hz (for teleoperation) frequency to ensure synchronized recording of state-input pairs. The coordinate frames of “world” and “vehicle” were aligned (for initial configuration of X=0, Y=0, ψ=0) as shown above (R=X, G=Y, B=Z). This way, skidpad test starts with ψ ≈ 0°, while slalom and fishhook tests start with ψ ≈ 180°.

The datasets were collected in 2 batches:
- **Clean:** Open loop control inputs applied to vehicle directly
- **Noisy:** Open loop control inputs applied to vehicle with added Gaussian noise sampled at each time instant (µ = 0, σ<sub>v</sub> = 0.1, σ<sub>δ</sub> = 0.1)

File naming convention used is quite straightforward, but here are the details just-in-case:

`<batch>_v_<velocity>_d_<steering>.<ext>`

- **`batch:`** type of dataset (`clean` or `noisy`)
- **`velocity:`** velocity command (decimal point is replaced by underscore symbol)
- **`steering:`** steering command (decimal point is replaced by underscore symbol)
- **`ext:`** file extension (`bag` or `mat`)

**Note:** All quantities are reported in SI units unless mentioned otherwise.

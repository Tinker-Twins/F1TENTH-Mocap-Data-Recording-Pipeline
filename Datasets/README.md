| ![Frames in 2D](https://user-images.githubusercontent.com/40835293/209375688-0b887492-34e5-47be-80f9-41bf444a63dd.png) | ![Frames in 3D](https://user-images.githubusercontent.com/40835293/209375755-af73b9ab-a2f4-4082-967c-51be455d555c.png) |
| :--------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------: |

Datasets were collected by throttling the topics at 60 Hz frequency to ensure synchronized recording of state-input pairs. The coordinate frames of “world” and “vehicle” were aligned (for initial configuration of X=0, Y=0, ψ=0) as shown above (R=X, G=Y, B=Z). This way, skidpad test starts with ψ ≈ 0°, while slalom and fishhook tests start with ψ ≈ 180°.

The datasets were collected in 3 batches:
- **Clean:** Open loop control inputs applied to vehicle directly
- **Noisy:** Open loop control inputs applied to vehicle with added Gaussian noise sampled at each time instant (µ = 0, σ<sub>v</sub> = 0.1, σ<sub>w</sub> = 0.2)
- **Disturbed:** Open loop control inputs applied to vehicle - with random water puddles acting as external disturbance to the system

File naming convention used is quite straightforward, but here are the details just-in-case:

`<batch>_v_<lin_vel>_w_<ang_vel>.<ext>`

- **`batch:`** type of dataset (`clean` or `noisy` or `dstrb`)
- **`lin_vel:`** linear velocity command (decimal point is replaced by underscore symbol)
- **`ang_vel:`** angular velocity command (decimal point is replaced by underscore symbol)
- **`ext:`** file extension (`bag` or `mat`)

**Note:** All quantities are reported in SI units unless mentioned otherwise.

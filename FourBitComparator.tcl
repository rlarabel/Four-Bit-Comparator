restart

#Wait out 100ns GSR (important for post-route timing simulation, but not for behavioral simulations)
add_force A(0) {1 0ns}
add_force B(0) {0 0ns}
run 100ns

add_force A(0) {0 0ns}
add_force A(1) {0 0ns}
add_force B(1) {1 0ns}
run 20ns

add_force A(2) {1 0ns}
add_force B(1) {0 0ns}
add_force B(2) {0 0ns}
run 20ns

add_force A(2) {0 0ns}
add_force B(3) {1 0ns}
add_force A(3) {0 0ns}
run 20ns

add_force B(3) {0 0ns}
add_force cAeqB {0 0ns}
add_force cAltB {0 0ns}
add_force cAgtB {1 0ns}
run 20ns


add_force cAltB {1 0ns}
add_force cAgtB {0 0ns}
run 20ns

add_force cAeqB {1 0ns}
add_force cAltB {1 0ns}
add_force cAgtB {1 0ns}
run 20ns

add_force cAeqB {0 0ns}
add_force cAltB {1 0ns}
add_force cAgtB {1 0ns}
run 20ns


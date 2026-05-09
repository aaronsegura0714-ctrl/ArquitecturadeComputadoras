# PRUEBA DE INSTRUCCIONES TIPO R

# Aritméticas y Lógicas (rd, rs, rt)
add $t0, $s1, $s2
sub $t1, $t0, $s3
and $t2, $s4, $s5
or  $t3, $t1, $t2
xor $t4, $t2, $t3
slt $t5, $s1, $s2

# Desplazamientos (rd, rt, shamt)
# rs debe quedar en 00000 internamente
srl $s6, $t4, 2
sra $s7, $t5, 4

# Trampas (rs, rt)
# rd y shamt qudan en 00000
teq $s1, $s2
tge $t0, $t1

# Operación Nula
nop
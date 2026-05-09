import tkinter as tk
from tkinter import filedialog, messagebox

# Tablas MIPS
REG = {
    "$zero": "00000", "$at": "00001", "$v0": "00010", "$v1": "00011",
    "$a0": "00100", "$a1": "00101", "$a2": "00110", "$a3": "00111",
    "$t0": "01000", "$t1": "01001", "$t2": "01010", "$t3": "01011",
    "$t4": "01100", "$t5": "01101", "$t6": "01110", "$t7": "01111",
    "$s0": "10000", "$s1": "10001", "$s2": "10010", "$s3": "10011",
    "$s4": "10100", "$s5": "10101", "$s6": "10110", "$s7": "10111",
    "$t8": "11000", "$t9": "11001"
}

FUNCT = {
    "add": "100000", "sub": "100010", "and": "100100", "or": "100101",
    "xor": "100110", "slt": "101010", "srl": "000010", "sra": "000011",
    "tge": "110000", "teq": "110100"
}

def to_bin(val, bits):
    """Convierte un número a binario con n bits."""
    return format(int(val), f'0{bits}b')

# --- LÓGICA DE CONVERSIÓN ---
def ensamblar_linea(linea):
    linea = linea.split('#')[0].replace(',', ' ').strip().lower()
    if not linea: return None
    
    partes = linea.split()
    inst = partes[0]
    
    if inst == "nop":
        return "0" * 32

    # para tipo r se mantiene en 0
    opcode = "000000"
    
    try:
        if inst in ["add", "sub", "and", "or", "xor", "slt"]:
            rd, rs, rt = partes[1], partes[2], partes[3]
            return opcode + REG[rs] + REG[rt] + REG[rd] + "00000" + FUNCT[inst]
            
        elif inst in ["srl", "sra"]:
            rd, rt, shamt = partes[1], partes[2], partes[3]
            return opcode + "00000" + REG[rt] + REG[rd] + to_bin(shamt, 5) + FUNCT[inst]
            
        elif inst in ["tge", "teq"]:
            rs, rt = partes[1], partes[2]
            return opcode + REG[rs] + REG[rt] + "00000" + "00000" + FUNCT[inst]
            
    except Exception as e:
        return f"ERROR en línea: {linea}"
    return None

# funciones para la interfasz, subida de archivo
def seleccionar_archivo():
    ruta = filedialog.askopenfilename(filetypes=[("MIPS Assembly", "*.asm"), ("Text files", "*.txt")])
    if ruta:
        entrada_ruta.delete(0, tk.END)
        entrada_ruta.insert(0, ruta)

def procesar_archivo():
    ruta_origen = entrada_ruta.get()
    if not ruta_origen:
        messagebox.showwarning("Atención", "Primero carga un archivo .asm")
        return

    try:
        with open(ruta_origen, 'r') as f:
            lineas = f.readlines()

        resultado = []
        for l in lineas:
            binario = ensamblar_linea(l)
            if binario:
                resultado.append(binario)

        ruta_destino = filedialog.asksaveasfilename(defaultextension=".bin", filetypes=[("Binary file", "*.bin"), ("Text file", "*.txt")])
        if ruta_destino:
            with open(ruta_destino, 'w') as f:
                f.write("\n".join(resultado))
            messagebox.showinfo("Éxito", "Archivo binario generado correctamente.")
            
    except Exception as e:
        messagebox.showerror("Error", f"No se pudo procesar: {e}")

# diseno ventana
root = tk.Tk()
root.title("MIPS Ensamblador - Solo Tipo R")
root.geometry("500x250")

tk.Label(root, text="Conversor ASM a Binario", font=("Arial", 14, "bold")).pack(pady=10)

# Fila de carga
frame_carga = tk.Frame(root)
frame_carga.pack(pady=10)

btn_cargar = tk.Button(frame_carga, text="Cargar archivo .asm", command=seleccionar_archivo)
btn_cargar.pack(side=tk.LEFT, padx=5)

entrada_ruta = tk.Entry(frame_carga, width=40)
entrada_ruta.pack(side=tk.LEFT, padx=5)

# Boton convertir
btn_convertir = tk.Button(root, text="CONVERTIR A BINARIO", bg="#4CAF50", fg="white", 
                          font=("Arial", 10, "bold"), command=procesar_archivo)
btn_convertir.pack(pady=20, ipadx=10, ipady=5)

root.mainloop()
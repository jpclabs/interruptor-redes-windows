# 🔌 Control de Adaptadores de Red para Windows (JPC Labs)

Herramienta ligera en Batch + PowerShell para **activar o desactivar todos los adaptadores de red en Windows** de forma instantánea desde un menú interactivo en consola.

Diseñada para realizar pruebas reales de **Inteligencia Artificial en local (100 % sin internet)**, auditorías de privacidad y entornos aislados sin tener que desenchufar cables ni navegar por los ajustes de red de Windows.

---

## 📋 Qué hace exactamente

Al ejecutar el archivo se abre un menú sencillo con tres opciones:
* **`1. DESACTIVAR todas las redes`:** Ejecuta `Get-NetAdapter | Disable-NetAdapter -Confirm:$false` mediante PowerShell, cortando al instante todas las conexiones activas (`Ethernet`, `Wi-Fi`, adaptadores virtuales, etc.).
* **`2. ACTIVAR todas las redes`:** Ejecuta `Get-NetAdapter | Enable-NetAdapter -Confirm:$false`, restaurando todos los adaptadores de red del equipo.
* **`3. Salir`:** Cierra la ventana sin realizar cambios.

---

## 🚀 Cómo descargarlo y usarlo

1. Haz clic sobre el archivo **`Control_Adaptadores_Red.bat`** en este repositorio y pulsa el botón de descarga (**Download raw file**).
2. Haz **clic derecho** sobre el archivo descargado y selecciona **"Ejecutar como administrador"** *(el propio script incluye una comprobación de seguridad y te avisará si olvidas abrirlo con privilegios de administrador)*.
3. Escribe **`1`**, **`2`** o **`3`** según la acción que necesites y pulsa **Enter**.

---

## ⚠️ Requisitos y notas importantes
* **Sistema operativo:** Windows 10 o Windows 11 (con PowerShell habilitado por defecto).
* **Permisos:** Requiere ejecución como **Administrador** para modificar el estado de los adaptadores de red.
* **Adaptadores virtuales:** Si utilizas máquinas virtuales (VMware, VirtualBox, Hyper-V) o VPNs, ten en cuenta que la opción `1` deshabilitará todos los adaptadores detectados en el sistema y la opción `2` volverá a habilitarlos todos.
* **Licencia:** Código abierto bajo licencia **MIT** — creado por **JPC Labs**.

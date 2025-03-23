# RMC-Money-Wash
This is a **money laundering script** for **QB-Core**, using **ox_inventory** and **ox_target**.   Players can exchange `black_money` for clean cash by interacting with a rotating NPC.  

# 💰 FiveM Money Laundering Script (QB-Core + ox_inventory)

This is a **money laundering script** for **QB-Core**, using **ox_inventory** and **ox_target**.  
Players can exchange `black_money` for clean cash by interacting with a rotating NPC.  

## 📌 Features
✔ **Ped spawns at random locations from config**  
✔ **Ped moves every 5 minutes to a new location**  
✔ **Uses `ox_target` for interaction**  
✔ **Configurable locations** (`config.lua`)  
✔ **Time-based money laundering process**  

![1377fae9-0b45-4334-8e8f-5d28838d33a9 (1)](https://github.com/user-attachments/assets/807053ae-9de7-434e-9318-1a6a2da5de45)

---

## 📥 Installation Guide

### 1️⃣ **Download & Extract**
1. Download the script files.
2. Place the folder inside your FiveM resources:  


### 2️⃣ **Ensure Dependencies**
Make sure you have the following required scripts installed:
- ✅ **[QB-Core](https://github.com/qbcore-framework/qb-core)**
- ✅ **[ox_inventory](https://github.com/overextended/ox_inventory)**
- ✅ **[ox_target](https://github.com/overextended/ox_target)**
- ✅ **[okokNotify](https://okok.tebex.io/) (Optional, for notifications)**

---

### 3️⃣ **Configuration**
Edit `config.lua` to set the **laundering locations**.  
Example:
```lua
Config = {}

Config.LaunderingLocations = {
 { coords = vector4(1135.2, -989.2, 46.1, 90.0) },
 { coords = vector4(-1327.8, -390.5, 36.7, 180.0) },
 { coords = vector4(251.3, -1012.8, 29.2, 270.0) }
}


ensure rmc_moneywash

Approach the NPC (ped).

Press E (or interact via ox_target).

If you have black_money, laundering begins.

Wait 30 - 60 minutes for the process to complete.

Get notified when your clean money is ready.

💡 Credits
Developed by RMC Developments

Framework: QB-Core

Inventory: ox_inventory

Interaction: ox_target

Notifications: okokNotify

Discord:https://discord.gg/Fz2U7CXRb2

![1377fae9-0b45-4334-8e8f-5d28838d33a9 (1)](https://github.com/user-attachments/assets/c8c24ca5-6051-4629-8382-b3af1daedc4a)


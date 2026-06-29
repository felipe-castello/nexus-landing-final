# Nexus IoT Energy Landing Page - Deploy VPS

Domínio da landing page:
- https://www.nexusiotenergy.com.br

Acesso da plataforma:
- https://app.nexusiotenergy.com.br

## 1. Enviar para VPS

No seu computador:

```bash
scp nexus_iot_energy_landing_vps_final.zip root@IP_DA_VPS:/root/
```

## 2. Acessar VPS

```bash
ssh root@IP_DA_VPS
```

## 3. Instalar dependências

```bash
sudo apt update
sudo apt install nginx unzip rsync certbot python3-certbot-nginx -y
```

## 4. Subir projeto

```bash
cd /root
unzip nexus_iot_energy_landing_vps_final.zip
cd nexus_iot_energy_landing_vps_final
chmod +x deploy.sh
./deploy.sh
```

## 5. Ativar SSL

```bash
sudo certbot --nginx -d nexusiotenergy.com.br -d www.nexusiotenergy.com.br
```

## 6. Testar

```bash
sudo nginx -t
sudo systemctl status nginx
```

Acesse:

```text
https://www.nexusiotenergy.com.br
```

## Observação

Antes do SSL funcionar, o DNS precisa apontar para o IP da VPS:

```text
Tipo A | @   | IP_DA_VPS
Tipo A | www | IP_DA_VPS
```

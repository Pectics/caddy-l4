# caddy-l4

Caddy `2.11.9` with [caddy-l4](https://github.com/mholt/caddy-l4) master `eafc300` (includes `caddy.packetconns.layer4`), built by GitHub Actions.

## 构建

推送 `main` 或手动运行 workflow，产物：

- GHCR: `ghcr.io/pectics/caddy-l4:2.11.9`（需将 package 设为 public）
- Artifact: `caddy-l4_2.11.9_amd64.tar.gz`

## 使用

```bash
docker pull ghcr.io/pectics/caddy-l4:2.11.9
# 或
gunzip -c caddy-l4_2.11.9_amd64.tar.gz | docker load
```

替换 compose 中的 caddy 镜像，配置与数据卷不变：

```yaml
services:
  caddy:
    image: ghcr.io/pectics/caddy-l4:2.11.9
```

```bash
docker compose up -d caddy
```

## 验证

```bash
docker run --rm ghcr.io/pectics/caddy-l4:2.11.9 caddy list-modules | grep layer4
```

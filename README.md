# jnn_mobile

> **Agent Instructions:**
> - Use Lucide icons (https://lucide.dev/icons) for all icon needs. Do NOT use Flutter's built-in Icons.* or Material icons — always use the `LucideIcons.*` package instead.
> - JSON keys must use **camelCase** naming convention.
> - For loading states, use the `Skeletonizer` widget with a layout-shaped placeholder (mirror the real content structure). Do NOT use `CircularProgressIndicator` — the only exception is a small inline spinner inside a button label (e.g. an in-flight submit button), where skeletonizing isn't possible.

## CI Builds & Releases

Two GitHub Actions workflows build and publish signed APKs as GitHub Releases (which [Obtainium](https://github.com/ImranR98/Obtainium) reads to install/update the app):

| Branch | Workflow | Flavor | Application ID | Release tag |
| --- | --- | --- | --- | --- |
| `main` | [`deploy-production.yml`](.github/workflows/deploy-production.yml) | `production` | `dev.iamutaki.jnn_mobile` | `production-v<version>` |
| `develop` | [`deploy-staging.yml`](.github/workflows/deploy-staging.yml) | `staging` | `dev.iamutaki.jnn_mobile.staging` | `staging-v<version>` |

Each build produces **3 split-per-ABI APKs** (`arm64-v8a`, `armeabi-v7a`, `x86_64`), signed with a stable release keystore so Obtainium can update the app in place.

### Releasing a new version

Bump `version:` in [pubspec.yaml](pubspec.yaml) and push to the target branch. The workflow builds and creates/updates the matching GitHub Release automatically. (A push without a bump refreshes the existing release in place rather than failing.)

### One-time setup: signing keystore + secrets

A single release keystore is shared by both workflows. Generate it locally (keep it safe and never commit it — it's already gitignored via `android/.gitignore`):

```bash
keytool -genkey -v -keystore upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias upload
base64 -i upload-keystore.jks | pbcopy        # macOS: copies base64 to clipboard
```

Add these 4 **repository secrets** (Settings → Secrets and variables → Actions), used by both workflows:

| Secret | Value |
| --- | --- |
| `KEYSTORE_BASE64` | base64-encoded `.jks` (output of the `base64` command above) |
| `KEYSTORE_PASSWORD` | keystore password set during `keytool` |
| `KEY_ALIAS` | `upload` (or the alias you chose) |
| `KEY_PASSWORD` | key password set during `keytool` |

Local builds without a keystore automatically fall back to debug signing, so day-to-day dev is unaffected.

### Obtainium setup

Add the app in Obtainium via **GitHub** source, repo `iamutaki/jnn_mobile`. Create two entries:

- **Production** — Release/binary version filter (RegEx): `production-v`; **APK filter (RegEx)**: `arm64-v8a`
- **Staging** — Release/binary version filter (RegEx): `staging-v`; **APK filter (RegEx)**: `arm64-v8a`

The ABI filter (`arm64-v8a`) selects one APK per device. The two apps have distinct application IDs, so production and staging can coexist on the same device.

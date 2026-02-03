# Set all required secrets for moltworker
# Run this script from the moltworker directory

Write-Host "Setting Cloudflare Worker secrets..."

# Array of secrets to set
$secrets = @(
    @{ name = "MOLTBOT_GATEWAY_TOKEN"; value = "27f70a1d90821f1332939be8861ff9a32cb56b2f1dd1e9a768db0dbd6b6ab8df" },
    @{ name = "AI_GATEWAY_API_KEY"; value = "L5gPgwF6F-QtImFGErTknCjdL9b3DYiQxLioFPqV" },
    @{ name = "AI_GATEWAY_BASE_URL"; value = "https://gateway.ai.cloudflare.com/v1/d8ee2c96edd90d9126136f05506ed95d/moltworker-gateway/compat" },
    @{ name = "CF_ACCOUNT_ID"; value = "d8ee2c96edd90d9126136f05506ed95d" },
    @{ name = "R2_ACCESS_KEY_ID"; value = "Y2chzlvJiPc2-YfwSmdNgaZw74YaaEVTFjMgpN_r" }
)

foreach ($secret in $secrets) {
    Write-Host "Setting $($secret.name)..."
    $secret.value | npx wrangler secret put $secret.name
    Write-Host "✓ $($secret.name) set successfully"
}

Write-Host "`nAll secrets have been set!"
Write-Host "Your worker is now configured and ready to use."

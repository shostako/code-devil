#!/usr/bin/env python3
"""
webapp テンプレート用 PermissionRequest フック

目的:
MCPツール（mcp__*）の自動許可のみを担当。
その他の権限管理はallowリストに委ねる。
"""

import json
import sys

def main():
    try:
        data = json.load(sys.stdin)
    except json.JSONDecodeError:
        sys.exit(2)

    tool_name = data.get("tool_name", "")

    # MCPツール（mcp__*）は全て自動承認
    if tool_name.startswith("mcp__"):
        print(json.dumps({
            "hookSpecificOutput": {
                "hookEventName": "PermissionRequest",
                "decision": {"behavior": "allow"}
            }
        }))
        return 0

    # その他はデフォルト動作（allowリストに委ねる）
    return 0

if __name__ == "__main__":
    sys.exit(main())

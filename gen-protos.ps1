rmdir -Force -Recurse lib/gen
buf generate buf.build/bdaya-dev/social-media-training --include-wkt --include-imports
buf generate .\local_protos
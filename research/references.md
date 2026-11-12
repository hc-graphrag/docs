# 参考事例と一次資料

調査確認日: 2026-11-12。リンク先は変化するため、判断前に再確認してください。

## 実装資料

- [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) — 指定された既存実装。確認時、src/graphrag_anthropic_llamaindex 配下に local/global/DRIFT search などのコードパスが存在。参照実装であり上流最新版と同一とは限りません。
- [既存実装の検索コード](https://github.com/hc-graphrag/llamaindex-python/tree/main/src/graphrag_anthropic_llamaindex)
- [LlamaIndex indexing guide](https://github.com/run-llama/llama_index/blob/main/docs/src/content/docs/framework/module_guides/indexing/index_guide.md) — Property Graph Index、抽出カスタマイズ、検索方法の公式説明。
- [LlamaIndex PropertyGraphIndex source](https://github.com/run-llama/llama_index/blob/main/llama-index-core/llama_index/core/indices/property_graph/base.py) — APIと既定値は使用版で要確認。
- [Microsoft GraphRAG repository](https://github.com/microsoft/graphrag) と [documentation](https://microsoft.github.io/graphrag/) — 公開実装とガイド。要件・費用は対象バージョンとデータで評価します。

## 確認済みと未確認

確認済み: 指定リポジトリに local/global/DRIFT 関連のコードパスがあること、LlamaIndex公式ガイドがProperty Graph Indexと検索部品を説明すること。

未確認: 現在の各機能の動作、互換性、性能、セキュリティ、顧客環境での効果。選定時にコード、依存固定、ライセンス、テストを直接確認してください。

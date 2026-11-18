# AIエージェント向けRAGシステムモデル

## 1. この資料の役割

この資料は、業務成果の定義からAIエージェントの行動結果までを一つのシステムとして捉え、主体、処理段階、入出力、責任境界を定義します。

RAGは、生成モデルと検索可能な外部記憶を結合する方式です。本システムでは、GraphRAGをAIエージェントへ業務コンテキストを供給する層に配置します。

## 2. システムへの入力

| 入力 | 定義する主体 | システム内での用途 |
|---|---|---|
| 業務成果 | お客様 | 完了状態と評価基準を定める |
| エージェントのユースケース | お客様とasopitech | 行動、対象、責任範囲を定める |
| 保有データ | お客様 | 行動に必要な根拠を構成する |
| 適合判定 | asopitech | 適用範囲と前提条件を定める |

## 3. 主体と責任

| 主体 | 責任 |
|---|---|
| お客様 | 業務成果、対象業務、利用条件、最終判断を定める |
| asopitech | ユースケースとデータの適合性を判断し、GraphRAGの適用を設計する |
| GraphRAG | データを索引化し、要求に応じた検索・コンテキスト構築を行う |
| AIエージェント基盤 | コンテキストを利用して計画、判断、ツール実行、結果確認を行う |
| 業務責任者 | 承認、決裁、公開、業務上の最終判断を行う |

## 4. 処理の流れ

~~~text
業務成果・ユースケース
  → asopitechによるデータ適合判定
  → GraphRAGの適用設計
  → データの取り込み・索引化
  → 実行時の検索・コンテキスト構築
  → AIエージェントの行動
  → 業務結果の確認
~~~

## 5. 段階ごとの入出力

| 段階 | 入力 | 出力 | 主体 |
|---|---|---|---|
| 適合判定 | ユースケース、保有データ | 判定、条件、不足 | asopitech |
| 適用設計 | 判定結果、行動要件 | GraphRAGの適用範囲 | asopitech |
| 索引化 | 対象データ、設定 | 検索可能な表現と参照 | GraphRAG |
| 検索 | エージェントの要求、索引 | 候補となる根拠と要約 | GraphRAG |
| コンテキスト構築 | 候補、原情報、制約 | エージェントへ渡すコンテキスト | GraphRAGと連携部品 |
| 行動 | コンテキスト、権限、ツール | 判断、生成物、実行結果 | AIエージェント基盤 |
| 業務確認 | 行動結果、根拠、完了条件 | 承認、差し戻し、次の行動 | 業務責任者 |

## 6. 二つのマッチング

| マッチング | 対象 | 実施主体 | 実施時点 |
|---|---|---|---|
| ユースケースとデータの適合 | 業務成果、行動、保有データ | asopitech | 導入前 |
| 実行要求と情報の照合 | 現在の要求、索引化した情報 | GraphRAG | 稼働時 |

## 7. GraphRAGとAIエージェント基盤の境界

GraphRAGの公式機能は、非構造テキストから知識グラフと階層要約を構築し、Local Search、Global Search、DRIFT Searchなどで回答用コンテキストを作ります。

AIエージェント基盤は、ユーザーの目的、現在状態、ツール仕様、権限、承認条件、完了条件を扱います。両者の接続条件と責任境界を設計します。

## 8. 失敗箇所の切り分け

| 観測された問題 | 確認する段階 |
|---|---|
| 必要な情報が存在しない | データ適合判定 |
| 根拠が索引へ反映されない | 取り込み・索引化 |
| 適切な根拠が選ばれない | 検索 |
| 根拠が行動に利用されない | コンテキスト構築・エージェント行動 |
| 完了状態へ到達しない | 行動契約・ツール実行・結果確認 |

## 9. 関連資料

- アセスメント項目: [ユースケース・データ適合アセスメント](enterprise-data-assessment.md)
- 情報変換の詳細: [情報圧縮・階層化・復元・コンテキスト注入の原理](information-compression-and-context-injection.md)
- 導入工程: [GraphRAG適用支援の進め方](graphrag-delivery-model.md)
- 測定方法: [段階別評価方式](evaluation.md)
- 実証シナリオ: [6業務ユースケース実証計画](use-cases/validation-plan.md)

## 10. 参考資料

- Patrick Lewis et al., [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401)
- Microsoft GraphRAG, [Welcome](https://microsoft.github.io/graphrag/)
- Microsoft GraphRAG, [Indexing Dataflow](https://microsoft.github.io/graphrag/index/default_dataflow/)
- Microsoft GraphRAG, [Query Engine](https://microsoft.github.io/graphrag/query/overview/)

# RAG / GraphRAGの既存評価研究とデータ準備資料

最終確認日: 2026-11-17

## 調査結果

RAG / GraphRAGには、検索結果や生成回答の品質を測る研究・評価枠組みがあります。また、データのAI利用準備を扱う公的ガイドや、RAG導入前の実務チェックリストも公開されています。

研究で提案された品質指標、公的なデータ準備ガイド、事業者の実務チェックリストは、それぞれ異なる対象と目的を扱います。あそぴてっくのアセスメントでは、これらを業務成果、ユースケース、保有データに合わせて組み合わせます。

この資料は、既存の評価研究・公開資料の内容と適用範囲を整理します。あそぴてっくが業務ごとに用いるチェックリストは、[AIエージェント導入のためのユースケース・データ適合アセスメント](../enterprise-data-assessment.md)にまとめています。

## 1. 既存研究のRAG評価枠組み

### RAGAS

[RAGAS: Automated Evaluation of Retrieval Augmented Generation](https://aclanthology.org/2024.eacl-demo.16/) は、検索された文脈の関連性、回答の忠実性、回答の関連性を分けて評価する枠組みです。論文は、参照回答がない状況での自動評価を扱います。

この枠組みは、回答の裏付け、質問への適合、検索文脈の簡潔性を評価する参考になります。業務固有のデータ準備、アクセス権、情報源の責任者、更新・削除は、あそぴてっくのアセスメントで確認します。

### ARES

[ARES: An Automated Evaluation Framework for Retrieval-Augmented Generation Systems](https://aclanthology.org/2024.naacl-long.20/)（NAACL 2024）は、文脈の関連性、回答の忠実性、回答の関連性を評価します。自動判定モデルに加えて少数の人手評価を利用し、評価の不確かさを扱う方法を提案しています。

人手確認を含めた評価設計の参考になります。各業務の導入条件と合格点は、ユースケースとデータに合わせて定めます。

### GraphRAG-Bench

[GraphRAG-Bench: Challenging Domain-Specific Reasoning for Evaluating Graph Retrieval-Augmented Generation](https://arxiv.org/abs/2506.02404)（2025年公開の研究論文）は、グラフ構築、知識検索、回答生成を含むパイプラインを評価します。複数段階の推論を要する質問などを扱い、最終回答と推論の一貫性を評価対象にしています。

GraphRAGのパイプラインを段階別に評価する参考です。特定業務のデータ権限と運用体制は、ユースケース・データ適合チェックリストで確認します。

### FinDoc-RAG：異種金融文書をまたぐ質問応答

[Assessing RAG System Capabilities on Financial Documents](https://aclanthology.org/2025.finnlp-2.9.pdf)（EMNLP 2025 FinNLP Workshop）は、金融機関の46文書から作成した600件超の質問・回答を使い、事実抽出、数値推論、複数文書の統合を評価しています。論文では、事実抽出と複数文書をまたぐ統合で結果に差が出ることを報告し、質問の種類に応じた評価の必要性を示しています。

文書をまたいで情報を統合する課題がRAGの評価対象として研究されている例です。金融領域以外への適用性は、対象業務のユースケースとデータを使って検証します。

## 2. 公開されているガイドと実務資料

### Microsoft GraphRAGの透明性資料

[Microsoft GraphRAG Responsible AI Transparency Note](https://github.com/microsoft/graphrag/blob/main/RAI_TRANSPARENCY.md) は、複数文書にまたがる情報や全体傾向を問う用途、回答の根拠・出典の確認、人による確認、プロンプトやデータ経由の攻撃、幻覚の評価などを説明しています。独自データでは小さなサンプルで索引処理を確認することも勧めています。

GraphRAGの適用条件とリスクを確認する参考になります。案件ごとの判定は、対象ユースケースと保有データを用いて行います。

### Microsoft FoundryのRAG評価資料

[Retrieval-Augmented Generation Evaluators](https://learn.microsoft.com/en-us/azure/foundry/concepts/evaluation-evaluators/rag-evaluators) は、検索段階と回答段階を分けた評価方法を説明します。検索対象の正解ラベルがある場合の順位指標や、ラベルがない場合のLLM判定などを扱っています。

検索段階と回答段階の評価指標を選ぶ際の実装例として参照します。

### 英国政府のAI向けデータ準備ガイド

[Guidelines and best practices for making government datasets ready for AI](https://www.gov.uk/government/publications/making-government-datasets-ready-for-ai/guidelines-and-best-practices-for-making-government-datasets-ready-for-ai) は、技術的な最適化、データとメタデータの品質、組織・基盤、法務・セキュリティ・倫理を含む観点を示しています。データをAIで利用する前の準備と責任分担を整理する公的資料として参照します。

### Microsoft ResearchのBenchmarkQED記事

[BenchmarkQED: Automated benchmarking of RAG systems](https://www.microsoft.com/en-us/research/blog/benchmarkqed-automated-benchmarking-of-rag-systems/) は、GraphRAGを含むRAG方式の比較例を紹介しています。全体質問に対する回答の網羅性、多様性、理解・判断への有用性、質問への関連性を評価しています。

これは特定のデータセット、質問、モデルで行った比較の紹介です。評価軸の例として読めますが、その結果や順位を別の業務へ一般化することはできません。

### 実務者によるデータ準備チェックリスト

[Enterprise Data Preparation for RAG: Readiness Guide](https://www.lucentinnovation.com/resources/it-insights/architecting-enterprise-data-for-rag-success) は、業務範囲、情報源の責任者、文書抽出、メタデータ、アクセス権、更新・削除、検索、回答不能時の扱い、運用体制を確認する実務上の例を示しています。

企業による実務記事として、チェック項目を検討する補助資料に使用します。研究上の品質指標と公的ガイドも併せて参照します。

## 3. 資料の使い分け

| 資料 | 主な対象 | アセスメントへの使い方 | 組み合わせる確認 |
|---|---|---|---|
| RAGAS、ARES | 検索文脈と生成回答の品質 | 関連性、根拠性、回答品質の評価項目を検討する | 業務データと運用準備を別途確認する |
| GraphRAG-Bench | GraphRAGパイプラインと複雑な質問 | グラフ構築・検索・生成を分けて見る | 業務ごとの合格点と権限準備を定める |
| Microsoft GraphRAG資料 | GraphRAGの用途、透明性、リスク | 適用する質問の性質、根拠確認、サンプル検証を検討する | 対象ユースケースと保有データで判定する |
| 英国政府ガイド | AI向けデータ準備とガバナンス | データ品質、責任、法務、権限を整理する | RAG固有の取得・生成評価を組み合わせる |
| 実務者ブログ | 導入前に確認する現場項目 | 情報源、権限、更新、抽出、運用の質問候補を得る | 研究上の品質指標と公的ガイドを組み合わせる |

## 4. あそぴてっくのアセスメントとの関係

[AIエージェント導入のためのユースケース・データ適合アセスメント](../enterprise-data-assessment.md)は、お客様が得たい業務成果とAIエージェントのユースケースに対し、保有データの内容、形式、由来、来歴、保持条件、権限、更新性が合っているかを確認し、GraphRAGをベースとするソリューションの適用範囲と実装方針を定めるための資料です。

チェックリストは、RAG / GraphRAGの評価研究、公開ガイド、本リポジトリの設計資料を参考に、あそぴてっくが業務向けに構成しています。研究上の品質指標と、業務ごとに定める導入条件・判定基準を分けて記録します。


# あそぴてっくのAIエージェント導入・GraphRAG適用ガイド

このリポジトリは、業務課題、AIエージェントに行わせたいユースケース、保有データの適合性をアセスメントする考え方をご説明する資料です。

[Microsoft Researchが研究・開発するGraphRAG](https://www.microsoft.com/en-us/research/project/graphrag/)を技術基盤として、お客様の業務課題に対するAIエージェント導入の構想、アセスメント、設計、実装、検証をご支援します。GraphRAGは、エージェントの状況認識、計画、判断、ツール実行、結果検証に必要なコンテキストを供給する基盤として適用します。

## アセスメントの起点

最初に、お客様が得たい業務成果と、AIエージェントに行わせたいユースケースを伺います。次に、保有データがそのユースケースに適合するかをアセスメントします。

アセスメント結果に基づき、GraphRAGのデータモデル、抽出、階層、検索経路、コンテキスト編成を対象業務へ対応付けます。ユースケースとデータの適合判断、およびGraphRAGの適用設計はasopitechが行います。

現在のコスト、品質、導入期間、再利用性を総合し、GraphRAGを現状の最尤解と技術者として判断しています。お客様の業務とデータに合わせたGraphRAGの導入をご提案申し上げます。

## このリポジトリでご確認いただけること

- AIエージェント導入に向けた業務課題と期待成果の整理
- ユースケースと保有データの適合性をasopitechが判断するアセスメントチェックリスト
- AIエージェントの行動へコンテキストを供給するRAGシステムモデル
- 情報圧縮、階層化、復元、コンテキスト注入の設計原則
- GraphRAGの提供範囲と対象業務への適用方法
- 行動完了、根拠、データ適合性、費用、遅延の評価方法
- 代表行動シナリオによる実証計画
- 技術的な主張、適用条件、検証状況の根拠

## 読み始める場所

- RAGの位置づけ: [RAGとは何か：AIエージェントの行動へコンテキストを供給するシステムモデル](rag-system-model.md)
- 上位原理: [情報圧縮・階層化・復元・コンテキスト注入の原理](information-compression-and-context-injection.md)
- 適用判断: [AIエージェント導入のためのユースケース・データ適合アセスメント](enterprise-data-assessment.md)
- 導入方法: [AIエージェント導入に向けたGraphRAG適用モデル](graphrag-delivery-model.md)
- 調査根拠: [AIエージェント向けRAGの設計根拠](research/agent-context-and-data-fitness.md)
- 評価方法: [RAG / GraphRAGの段階別評価方式](evaluation.md)
- 全資料: [資料一覧](INDEX.md)

## 実装と検証コード

実行可能な検証コードを [hc-graphrag/rag-usecase-demos](https://github.com/hc-graphrag/rag-usecase-demos)、GraphRAG実装を [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) で公開しています。

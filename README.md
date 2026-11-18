# あそぴてっくのAIエージェント導入・GraphRAG適用ガイド

このリポジトリは、あそぴてっくが提供するAIエージェント導入支援の公開資料です。お客様の業務課題からユースケースを定め、保有データとの適合性を確認する考え方をご案内します。

技術基盤には、[Microsoft Researchが研究・開発するGraphRAG](https://www.microsoft.com/en-us/research/project/graphrag/)を採用しています。

## ご相談からご提案まで

お客様が得たい業務成果と、AIエージェントに行わせたいユースケースを伺います。asopitechが保有データとの適合性を確認し、その結果に基づいてGraphRAGの適用をご提案申し上げます。

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

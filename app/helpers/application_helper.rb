module ApplicationHelper
  def default_meta_tags
    {
      site: 'SpeechLinks',
      title: 'TOP',
      reverse: true,
      separator: '-',
      description: 'SpeechLinksは自分の英語スピーチを共有することができるサービスです。自分の書いたスピーチを誰かに見てもらったり、日本中のスピーカーが書いたスピーチを見ることもできます。',
      keyword: 'SpeechLinks, 英語スピーチ, ESS, speech link',
      charaset: 'utf-8',
      icon: [
        {
          href: image_url('favicon.ico')
        },
        {
          href: image_url('apple-touch-icon.png'),
          rel: 'apple-touch-icon'
        }
      ]
    }
  end
end

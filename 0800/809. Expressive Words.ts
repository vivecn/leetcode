/**
 * @link https://leetcode.cn/problems/expressive-words/
 */
export function expressiveWords(s: string, words: string[]): number {
  /**
   * A group that consist of same letter
   */
  interface Count {
    /** the letter */
    key: string;
    /** the number of the letter */
    count: number;
  }

  /**
   * transform a word to a [Count] Array
   * @param word word you want to transform
   */
  const makeWordToCount = (word: string): Count[] => {
    const res: Count[] = [];
    let key = "";
    let count = 0;
    for (let i = 0; i < word.length; i++) {
      if (word[i] !== key) {
        res.push({
          key,
          count,
        });
        key = word[i];
        count = 1;
      } else {
        count++;
      }
    }

    res.push({
      key,
      count,
    });

    return res;
  };

  const sCount: Count[] = makeWordToCount(s);

  /**
   * Judge if the word stretchy
   * @param word the query word
   */
  const isStretchy = (word: string): boolean => {
    const query = makeWordToCount(word);
    if (sCount.length !== query.length) {
      return false;
    }

    for (let i = 0; i < sCount.length; i++) {
      switch (true) {
        case sCount[i].key !== query[i].key:
          return false;
        case sCount[i].count < query[i].count:
          return false;
        case sCount[i].count > query[i].count && sCount[i].count < 3:
          return false;
        default:
          break;
      }
    }

    return true;
  };

  return words.reduce((pre, cur) => (isStretchy(cur) ? 1 : 0) + pre, 0);
}

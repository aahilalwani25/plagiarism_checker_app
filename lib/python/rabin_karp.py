class StringMatch:

    def __init__(self, source: str, sentence: str) -> None:
        self.paragraph = source  # net searched content
        self.sentence = sentence  # user content
        self.plagiarised = set()
        # make patterns with space separated
        self.patterns = self.sentence.split(sep=" ")

    def search(self):
        lists = list()
        maxLength = 0
        for j in range(len(self.patterns)):
            pattern = self.patterns[j]
            if len(self.rabin_karp(pattern)) > maxLength:
                lists = (self.rabin_karp(pattern))
                maxLength = len(self.rabin_karp(pattern))
        return lists

    def rabin_karp(self, pattern: str):
        paragraphLength = len(self.paragraph)
        sentenceLength = len(self.sentence)
        for i in range(0, paragraphLength-sentenceLength-1, 1):
            paraHash = hash(self.paragraph[i:i+len(pattern)])
            patternHash = hash(pattern)

            if (paraHash == patternHash):
                if self.paragraph[i:i+len(pattern)] == pattern:
                    self.plagiarised.add(pattern)
        return list(self.plagiarised)

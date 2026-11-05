## MY Finds On video Compression
Recently i got a client a video editor, and he made a request *i need you*

---

My video is too big, I need you to change it from an MP4 to an MKV to make it smaller," you will instantly know they have no idea what they are talking about. And you will know exactly how to help them.

---



## Chapter 1: The language of video
Here we will have some understanding of how video files are layed out 

### the container vs the codex:
This two words are very important so lets see them 

### 1. Container:
This is simply the the shipping file (container), think of `.mp4`, `.mkv` as shipping containers , it just holds everything together in one neat pakage without any idea of what is inside or  if something is brocken or missing

-  the vid stream
- audio stream
- subtitles
- meta data

**Changing the container extension (e.g., renaming video.mkv to video.mp4) does not compress the video. It is literally just changing the label on the outside of the shipping box. The data inside hasn't changed by a single byte.**

where the containers matter most is shows when the video is being played extensions like `mp4` 2. The Codec (The Packing Method)
Codec stands for Coder-Decoder. This is the actual math that shrinks the video.
If the container is the shipping box, the codec is how tightly you packed the items inside.

You can put an H.264 codec inside an .mp4 box, an .mkv box, or a .mov box. The box stays the same; the compression method changes.are very popular and work on almost all devices

### 2. The Codec (The Packing Method):
Codec stands for Coder-Decoder. This is the actual math that shrinks the video.
If the container is the shipping box, the codec is how tightly you packed the items inside.

You can put an H.264 codec inside an `.mp4` box, an `.mkv` box, or a `.mov` box. The box stays the same; the compression method changes.

---

## lossless vs lossy compression

- lossless: This is compression where data is compressed and when decompressed is 100% identical to the original. Good in some cases but the files are still massive

- lossy: This is compression where there is loss of data to make the file smaller e.g the codec looks at the video and says the human ears wont notice the difference if i reduce the frequency of sound



## The Big Three Codecs (The ones you need to know)
Here are some codecs to master 

1. **H.264 (also known as AVC):** Compatibility: 100%. It plays on a 15-year-old laptop, an iPhone, a smart TV, and every web browser.

    ```
    The Catch: It doesn't compress as well as the newer codecs. If a client needs a video to play anywhere without breaking, you use H.264.
    ```

2. **H.265 (also known as HEVC):** It is 50% more efficient than H.264. A 1GB H.264 video can be compressed to 500MB with H.265 and look exactly the same.

    ```text
    The Catch: Licensing and compatibility. It’s owned by a patent pool (Apple, Sony, etc.). Windows 10/11 doesn't support it natively unless the user pays $0.99 in the Microsoft Store. It's great for archiving, but terrible for web streaming.
    ```

3. **AV1:** Compression: Even better than H.265.

    ``` 
    The Catch: It is incredibly slow to encode. Your CPU will run at 100% for a long time. Netflix and YouTube use it, but for a local backup, it might be overkill unless you have a powerful machine.
    ```


---

lets answer a small question if the client ask ***My videos are too big, I need you to convert them to a different format***

1. start by asking the user what the videos are for so you can know what container to use 

2. how small does the client need the videos to be also tell him of the tradeoffs 

3. dont accept anything unrealistic some clients over ask 
---



## CHAPTER 2: Math behind moving pictures


Here is the fundamental problem of video: A standard 1080p video at 30 frames per second (fps) has 30 full images flashing on your screen every single second. If you tried to store uncompressed raw video, a 2-hour movie would be several terabytes.

To make video small enough to stream or back up, the codec has to use two distinct types of compression.

### Layer 1 : Spacial compression( concept of I-frames)
This is compression within a single frame. Imagine taking a high-quality JPEG photo. The algorithm looks at the image and says:

```"This whole wall is just plain blue. Instead of storing 10,000 blue pixels, I'll just store one blue pixel and say 'repeat 10,000 times'."```

In video, these are called I-Frames (Intra-frames), also known as Keyframes. An I-Frame is essentially a complete, full-quality still image. If you ever pause a video and export that single frame, you are just seeing an I-Frame.

Why it matters: Without I-Frames, a video couldn't start. The player needs a complete picture to begin with.


### Layer 2: Temporal Compression ( concept of P-frames and B-frames)
Imagine a video of a person talking in front of a static bookshelf.
Does the bookshelf move? No. Does the person's shirt move much? No. Only their mouth and face are changing.

The codec says:

`"Instead of storing the bookshelf 30 times a second, I'll store the bookshelf ONCE. For the next 29 frames, I'll just write down 'keep the bookshelf the same, but move the lips 2 pixels down'."`

These are called `P-Frames (Predicted)` and `B-Frames (Bi-directional)`. They are tiny. They contain almost no image data—just mathematical instructions of what changed from the previous frame.
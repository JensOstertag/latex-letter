# latex-letter

My own LaTeX Documentclass for writing Letters. By now, it only supports the German Language.

## Installation

A quick Installation Guide. For more detailled Information, please take a Look at the Documentation.

### Getting Started

- Create a Project Folder on your Device, where you keep all your Document Files
- Download this Repository and move the File `latex-letter.cls` to your Project Folder.
- Create the `.tex`-File for your Document.

Your Project Folder should look like this:

```
Project Folder
  ╟─  latex-letter.cls
  ╙─  your_document.tex
```

### Document Setup

For a detailled Instruction on how to set up your Document, please take a Look at the Documentation.
There is a bare Minimum Script you can copy:

```
\documentclass[a4paper]{latex-letter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Document Information   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\documentTitle{Subject}
\documentDate{\today}

%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Sender Information   %
%%%%%%%%%%%%%%%%%%%%%%%%%%
\senderName{The Sender's Name}
\senderAddress{Street and House Number}
\senderAddress{Address Supplement}
\senderAddress{Postalcode and City}
\senderAddress{Country}
\senderPlace{City}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Receiver Information   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\receiverName{The Receiver's Name}
\receiverAddress{Street and House Number}
\receiverAddress{Postalcode and City}
\receiverAddress{Country}

%%%%%%%%%%%%%%%%%%%
%   Attachments   %
%%%%%%%%%%%%%%%%%%%
\attachment{Attachment 1}
\attachment{Attachment 2}

\begin{document}
\maketitle

Your Text Here
\end{document}
```

## Documentation

### Used Packages

- **ifthen** - used for Command Handling within the Documentclass
- **geometry** - used to set the Margin of the Document to 1in
- **inputenc** - used for UTF8-Encoding
- **babel** - used to print the Date in German Format
- **tikz** - used to draw the Letter Head and the Folding Marks at the Side of each Page
  There are also these TikZ-Packages included: - calc - positioning
- **scrlayer-scrpage** - used to draw the Folding Marks at the Side of each Page.

### Custom Commands

- **documentTitle** - sets the Subject of the Letter shown in the Letter Head
- **documentDate** - sets the Date of the Letter shown in the Letter Head

- **senderName** - sets the Sender's Name shown in the Address Field of the Sender
- **senderAddress** - adds the specified Line to the current Address Field of the Sender <sub>So to set the complete Address, you have to use this Command multiple Times</sub>
- **senderPlace** - sets the Sender's Place shown before the Date in the Letter Head

- **receiverName** - sets the Receiver's Name shown in the Address Field of the Receiver
- **receiverAddress** - adds the specified Line to the current Address Field of the Receiver <sub>So to set the complete Address, you have to use this Command multiple Times</sub>

- **windowHeight** - sets the Address Window Height - default 45mm
- **windowWidth** - sets the Address Window Width - default 90mm
- **windowOffsetTop** - sets the Offset of the Address Window from the Top - defualt 45mm
- **windowOffsetSide** - sets the Offset of the Address Window from the Side - default 20mm
- **windowOffsetDirection** - sets the Side from where the Side Offset is measured - default left

- **foldFirst** - sets the Distance of the first Fold from the Top - default 105mm
- **foldSecond** - sets the Distance of the second Fold from the Top - default 210mm

- **textOffsetTop** - sets the Offset for the main Text from the Top - default 65mm

- **attachment** - adds the specified Attachment to the current List of Attachments <sub>So to set multiple Attachments, you have to use this Command multiple Times</sub>

### Fonts

The default Font Family was replaced by _sfdefault_. All Paragraph Indents were set to 0.

### Usage

#### Setup

- Create a Project Folder on your Device, where you keep all your Document Files
- Download this Repository and move the File `latex-letter.cls` to your Project Folder.
- Create the `.tex`-File for your Document.

Your Project Folder should look like this:

```
Project Folder
  ╟─  latex-letter.cls
  ╙─  your_document.tex
```

#### Document Settings

Next, let's have a Look at the Code you have to write. There is an example Document available in the Repository, but this Instruction will describe the used Commands more detailled.

You have to start by defining a Documentclass. This should be, of course, _latex-letter_, so you can select it with

```
\documentclass{latex-letter}
```

You could also add Class Options, e.g. to change the Size of the Page:

```
\documentclass[a4paper]{latex-letter}
```

The next Task will be to set up the Documents Metadata: The Subject and the Date. Use the following Commands to do that.

```
\documentTitle{Subject}
\documentDate{Date}
```

To use the current Date as the Date in the Document, replace `Date` with `\date`.

Next, you have to specify Information of the Sender and the Receiver:

```
\senderName{The Sender's Name}
\senderAddress{Street and House Number}
\senderAddress{Address Supplement}
\senderAddress{Postalcode and City}
\senderAddress{Country}
\senderPlace{City}

\receiverName{The Receiver's Name}
\receiverAddress{Street and House Number}
\receiverAddress{Postalcode and City}
\receiverAddress{Country}
```

You are required to provide a `senderPlace` specifically, because it will be used in the Letter Head when printing the Date.
The Commands `senderAddress` and `receiverAddress` can be called multiple Times. Each Time, the given Text will be added to the already present Address, together with a new Line (for the Address Field) or a Comma Separation (for the inline Address).

Optionally, you can specify Attachments that come with this Letter. They will then be listed at the Bottom of the last Page. Use

```
\attachment{Attachment 1}
\attachment{Attachment 2}
```

as often as you need to. If you don't specify any Attachments, there won't be an Attachment List at the End of the Letter.

From here on, all Document Options are optional because there are default Values already. However, if those do not fit with your Envelope Dimensions, you should change them.

There are the Following Settings for the Address Window of the Envelope:

- **windowHeight** - sets the Address Window Height - default 45mm
- **windowWidth** - sets the Address Window Width - default 90mm
- **windowOffsetTop** - sets the Offset of the Address Window from the Top - defualt 45mm
- **windowOffsetSide** - sets the Offset of the Address Window from the Side - default 20mm
- **windowOffsetDirection** - sets the Side from where the Side Offset is measured - default left

Use the following Graphics to find the correct Measurements for your Envelope:
`windowOffsetDirection` left:

```
┌──────────┬─────────────────────┐
│          c                     │
│          │                     │
│   ┌──────┴───┬───┐             │
│   ├────b─────┼───┤             │
├─d─┤          a   │             │
│   └──────────┴───┘             │
└────────────────────────────────┘
```

`windowOffsetDirection` right:

```
┌──────────┬─────────────────────┐
│          c                     │
│          │                     │
│   ┌──────┴───┬───┐             │
│   ├────b─────┼───┤             │
│   │          a   ├──────d──────┤
│   └──────────┴───┘             │
└────────────────────────────────┘
```

a ≙ `windowHeight`
b ≙ `windowWidth`
c ≙ `windowOffsetTop`
d ≙ `windowOffsetSide`

There are the following Settings for the Folding Marks:

- **foldFirst** - sets the Distance of the first Fold from the Top - default 105mm
- **foldSecond** - sets the Distance of the second Fold from the Top - default 210mm

Use the following Graphic to find the correct Measurements for your Letter:

```
┌─────┬─────────┬────────────────┐
│     │         │                │
│     │         │                │
│     a         │                │
│     │         │                │
│     │         │                │
│-----┴---------│----------------│
│               │                │
│               │                │
│               b                │
│               │                │
│               │                │
│---------------┴----------------│
│                                │
│                                │
│                                │
│                                │
└────────────────────────────────┘
```

a ≙ `foldFirst`
b ≙ `foldSecond`

There are the following Settings for Text Offsets:

- **textOffsetTop** - sets the Offset for the main Text from the Top - default 65mm

Use the following Graphic to find the correct Measurements for your Letter:

```
┌─────────────────────────┬──────┐
│                         │      │
│   ---------             a      │
│   ---------             │      │
│   ---------             │      │
│                     ----┴----  │
│  ----------------------------  │
│  ----------------------------  │
│  ----------------------------  │
│  ----------------------------  │
│  ----------------------------  │
│  ----------------------------  │
│  ----------------------------  │
│  ------------                  │
│                                │
│  -----                         │
│                                │
└────────────────────────────────┘
```

a ≙ `textOffsetTop`

#### Adding Contents to the Document

Now, you can add Contents to your Document inside

```
\begin{document}
    % Your Content Here
\end{document}
```

You may want to start by creating the Letter Head. Add it by using the Command

```
\maketitle
```

//
//  ObjectView.swift
//  Chapter22
//
//  Created by Louise Rennick on 2025-02-19.
//


import SwiftUI

struct ObjectView: View {
  let object: Object

  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        if let url = URL(string: object.objectURL) {
          Link(destination: url) {
            WebIndicatorView(title: object.title)
              .multilineTextAlignment(.leading)
              .font(.callout)
              .frame(minHeight: 44)
              .padding()
              .background(Color(hue: 0.116, saturation: 0.890, brightness: 0.893)) // Change background color here
              .foregroundColor(Color.white)
              .cornerRadius(10)
          }
        } else {
          Text(object.title)
            .multilineTextAlignment(.leading)
            .font(.callout)
            .frame(minHeight: 44)
            .padding()
            .background(Color.green) // Change background color here
            .foregroundColor(.white)
            .cornerRadius(10)
        }

        // Display object image if public domain
        if object.isPublicDomain {
          AsyncImage(url: URL(string: object.primaryImageSmall)) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .cornerRadius(12)
              .shadow(radius: 5)
          } placeholder: {
            PlaceholderView(note: "Display image here")
          }
        } else {
          PlaceholderView(note: "Not in public domain. URL not valid.")
        }

        // Display additional information
        VStack(alignment: .leading, spacing: 12) {
          Text("Details")
            .font(.headline)
            .foregroundColor(.romForeground)
          Text("ID: \(object.objectID)")
            .font(.subheadline)
            .foregroundColor(.secondary)
          Text("Credit Line: \(object.creditLine)")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.yellow.opacity(0.1)) // Change background color here
        .cornerRadius(10)

        // Add more object-related info here as needed
        Text("Additional Information")
          .font(.title2)
          .bold()
        Text("This object has a rich history, including ...")
          .font(.body)
          .padding(.top, 5)
          .background(Color.purple.opacity(0.1)) // Change background color here
          .cornerRadius(10)

        // Facts in point form
        VStack(alignment: .leading, spacing: 10) {
          Text("Here are a few short facts about the Esquimaux:")
            .font(.headline)
            .foregroundColor(.romForeground)

          Text("• Historical Context: The term \"Esquimaux\" was historically used by Europeans to refer to the Inuit and other indigenous peoples of the Arctic regions. However, the term is now considered outdated and offensive, and \"Inuit\" is preferred.")
            .font(.body)
            Spacer()
          Text("• Portrait of Ogemawwah Chack: The portrait you mentioned, An Esquimaux, Portrait of Ogemawwah Chack, The Spirit Chief, Inuit, depicts Ogemawwah Chack, a prominent figure in Inuit culture, painted in the mid-1800s.")
            .font(.body)
            Spacer()
          Text("• Inuit Culture: The Inuit people have a rich cultural heritage, with a deep connection to the Arctic environment. They are known for their hunting, fishing, and storytelling traditions.")
            .font(.body)
            Spacer()
          Text("• Artistic Representation: During the 19th century, many Inuit were depicted in Western art as exotic or \"other.\" These portraits often reflect European views of indigenous peoples rather than accurate representations of their cultures.")
            .font(.body)
            Spacer()
          Text("• Inuit Identity: Today, the Inuit are recognized as the indigenous peoples of the Arctic regions, primarily in Canada, Greenland, and Alaska, with distinct languages, traditions, and histories.")
            .font(.body)
            Spacer()
          Text("• Ogemawwah Chack: He was a notable Inuit leader and spiritual figure, known for his role in his community. The portrait reflects both his stature and the symbolic role he played in Inuit society.")
            .font(.body)
        }
        .padding()
        .background(Color.green.opacity(0.1)) // Change background color here
        .cornerRadius(10)
      }
      .padding(.vertical)
      .background(Color.white) // Change background color for the whole ScrollView
    }
  }
}

struct ObjectView_Previews: PreviewProvider {
  static var previews: some View {
    ObjectView(
      object: Object(
        objectID: 28263,
        title: "An Esquimaux",
        creditLine: "Gift of Arthur A. Houghton Jr., 1970",
        objectURL: "https://collections.rom.on.ca/internal/media/dispatcher/28263/preview",
        isPublicDomain: true,
        primaryImageSmall: "https://collections.rom.on.ca/internal/media/dispatcher/28263/preview"))
  }
}

struct PlaceholderView: View {
  let note: String
  var body: some View {
    ZStack {
      Rectangle()
        .inset(by: 7)
        .fill(Color.romForeground)
        .border(Color.romBackground, width: 7)
        .padding()
      Text(note)
        .foregroundColor(.romBackground)
    }
  }
}

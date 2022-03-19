# react-native-unity-play-ts

react-native-unity-play-ts

## Installation

```sh
npm install react-native-unity-play-ts
```

## Usage

```js
import React, { useRef, useEffect } from 'react';
import UnityPlayView from 'react-native-unity-play-ts';

interface IMessage {
  gameObject: string;
  methodName: string;
  message: string;
}

const Unity = () => {
  const unityRef = useRef();

  const message: IMessage = {
    gameObject: 'gameObject',
    methodName: 'methodName',
    message: 'message',
  };

  useEffect(() => {
    if (unityRef && unityRef.current) {
      unityRef.current.postMessage(message);
    }
  }, []);

  return <UnityPlayView ref={unityRef} style={{ flex: 1 }} />;
};

export default Unity;

```

### iOS

1. Build Unity app to `[project_root]/unity/builds/ios`
2. Add `Unity-iPhone.xcodeproj` to your workspace: `Menu` -> `File` -> `Add Files to [workspace_name]...` -> `[project_root]/unity/builds/ios/Unity-iPhone.xcodeproj`
3. Add `UnityFramework.framework` to `Frameworks, Libraries, and Embedded Content`:
4. Select Data folder and set a checkbox in the "Target Membership" section to "UnityFramework"


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
